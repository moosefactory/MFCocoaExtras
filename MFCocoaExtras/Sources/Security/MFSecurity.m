/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - v1.0.0                    */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2016 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

/*
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "MFSecurity.h"


#if !TARGET_OS_IPHONE
    #import <IOKit/IOTypes.h>
#else
    #import <UIKit/UIDevice.h>
#endif

#import <Security/Security.h>


#if !TARGET_OS_IPHONE
// Returns a CFData object, containing the computer's GUID.
inline CFDataRef copy_mac_address(void)
{
    kern_return_t             kernResult;
    mach_port_t               master_port;
    CFMutableDictionaryRef    matchingDict;
    io_iterator_t             iterator;
    io_object_t               service;
    CFDataRef                 macAddress = nil;
    
    kernResult = IOMasterPort(MACH_PORT_NULL, &master_port);
    if (kernResult != KERN_SUCCESS) {
        printf("IOMasterPort returned %d\n", kernResult);
        return nil;
    }
    
    matchingDict = IOBSDNameMatching(master_port, 0, "en0");
    if (!matchingDict) {
        printf("IOBSDNameMatching returned empty dictionary\n");
        return nil;
    }
    
    kernResult = IOServiceGetMatchingServices(master_port, matchingDict, &iterator);
    if (kernResult != KERN_SUCCESS) {
        printf("IOServiceGetMatchingServices returned %d\n", kernResult);
        return nil;
    }
    
    while((service = IOIteratorNext(iterator)) != 0) {
        io_object_t parentService;
        
        kernResult = IORegistryEntryGetParentEntry(service, kIOServicePlane,
                                                   &parentService);
        if (kernResult == KERN_SUCCESS) {
            if (macAddress) CFRelease(macAddress);
            
            macAddress = (CFDataRef) IORegistryEntryCreateCFProperty(parentService,
                                                                     CFSTR("IOMACAddress"), kCFAllocatorDefault, 0);
            IOObjectRelease(parentService);
        } else {
            printf("IORegistryEntryGetParentEntry returned %d\n", kernResult);
        }
        
        IOObjectRelease(service);
    }
    IOObjectRelease(iterator);
    
    return macAddress;
}

#else

inline CFDataRef copy_mac_address(void)
{
    NSString* uid = NULL;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        uid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return (__bridge CFDataRef)[uid dataUsingEncoding:NSUTF8StringEncoding];
}
#endif

// Get Certificate from keychain

#if !TARGET_OS_IPHONE

inline SecCertificateRef AppleRootCA( void )
{
    SecKeychainRef roots = NULL;
    SecKeychainSearchRef search = NULL;
    SecCertificateRef cert = NULL;
    bool cfReleaseKeychain = true;
    
    // there's a GC bug with this guy it seems
    OSStatus err = SecKeychainOpen( "/System/Library/Keychains/SystemRootCertificates.keychain", &roots );
    
    if ( err != noErr )
    {
        CFStringRef errStr = SecCopyErrorMessageString( err, NULL );
        CFRelease( errStr );
        return NULL;
    }
    
    SecKeychainAttribute labelAttr = { .tag = kSecLabelItemAttr, .length = 13, .data = (void *)"Apple Root CA" };
    SecKeychainAttributeList attrs = { .count = 1, .attr = &labelAttr };
    
    err = SecKeychainSearchCreateFromAttributes( roots, kSecCertificateItemClass, &attrs, &search );
    if ( err != noErr )
    {
        CFStringRef errStr = SecCopyErrorMessageString( err, NULL );
        CFRelease( errStr );
        if ( cfReleaseKeychain )
            CFRelease( roots );
        return NULL;
    }
    
    SecKeychainItemRef item = NULL;
    err = SecKeychainSearchCopyNext( search, &item );
    if ( err != noErr )
    {
        CFStringRef errStr = SecCopyErrorMessageString( err, NULL );
        CFRelease( errStr );
        if ( cfReleaseKeychain )
            CFRelease( roots );
        
        return NULL;
    }
    
    cert = (SecCertificateRef)item;
    CFRelease( search );
    CFRelease( roots );
    
    return ( cert );
}

inline bool check_code_signature()
{
    SecStaticCodeRef staticCode = NULL;
    bool result = false;
    if ( SecStaticCodeCreateWithPath((__bridge CFURLRef)[[NSBundle mainBundle] bundleURL], kSecCSDefaultFlags, &staticCode) == noErr )
    {
        result =  ( SecStaticCodeCheckValidity(staticCode, kSecCSCheckAllArchitectures, NULL) == noErr );
    }
    return result;
}

#else

inline SecCertificateRef AppleRootCA( void )
{
    OSStatus status = errSecSuccess;
    CFStringRef certLabel = CFStringCreateWithCString(NULL, "Apple Root CA",kCFStringEncodingUTF8);
    
    const void *keys[] =   { kSecClass, kSecAttrLabel, kSecReturnRef};
    const void *values[] = { kSecClassCertificate, certLabel, kCFBooleanTrue };
    CFDictionaryRef dict = CFDictionaryCreate(NULL, keys,values, 3,NULL, NULL);
   
    SecCertificateRef cert = NULL;
    status = SecItemCopyMatching(dict, (CFTypeRef*)&cert);
    
    // Not working - Not understood why yet - always get a -23500 error :(
    // So use a certificate included in the project ( add it manualy)

    if (status != errSecSuccess) {
        if (cert) CFRelease(cert);
        cert = NULL;

        NSURL *appleRootURL = [[NSBundle mainBundle] URLForResource:@"AppleIncRootCertificate" withExtension:@"cer"];
        NSData *appleRootData = [NSData dataWithContentsOfURL:appleRootURL];
        
        // Last way, if no cert is present, download it from Apple
        if (!appleRootData || !appleRootData.length) {
            appleRootURL = [NSURL URLWithString:@"https://www.apple.com/appleca/AppleIncRootCertificate.cer"];
            appleRootData = [NSData dataWithContentsOfURL:appleRootURL];

            if (!appleRootData || !appleRootData.length) {
                return NULL;
            }
        }
        
        cert = SecCertificateCreateWithData(NULL,(CFDataRef)appleRootData);
    }
    return ( cert );
}

// Code Signing is automatically checked when iOS process are launched
inline bool check_code_signature()
{
    return true;
}

#endif


