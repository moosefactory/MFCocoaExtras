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

#import "MFSystem.h"

#include <errno.h>
#include <sys/sysctl.h>

static int          sysctl_err; // Sticky error after last call

static NSString*    systVersion;
static float        systVersionFloat;
static NSString*    systVersionPatch;
static float        systVersionPatchFloat;

@implementation MFSystem

+(NSString*)machine
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.machine", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)model
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.model", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)cpu
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.cpu", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSInteger)byteorder
{
    int byteorder;
    size_t size = sizeof(byteorder);
    sysctl_err = sysctlbyname("hw.byteorder", &byteorder, &size, NULL, 0);
    return byteorder;
}

+(NSString*)architecture
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.arch", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)kernelVersion
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("kern.version", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

#pragma mark - System

+(NSString*)kernelRelease
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("kern.osrelease", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)kernelRevision
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("kern.osrev", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)systemVersionPatch
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (!systVersionPatch) {
        systVersionPatch = [NSString stringWithFormat:@"%lu.%lu.%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion,(unsigned long)opSystVersion.patchVersion];
    }
    return systVersionPatch;
}

+(NSString*)systemVersion
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (!systVersion) {
        systVersion = [NSString stringWithFormat:@"%lu.%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion];
    }
    return systVersion;
}

+(float)systemVersionFloat
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (systVersionFloat==0.0f) {
        systVersionFloat = [[NSString stringWithFormat:@"%lu.%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion] floatValue];
    }
    return systVersionFloat;
}

+(float)systemVersionPatchFloat
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (systVersionPatchFloat==0.0f) {
        systVersionPatchFloat = [[NSString stringWithFormat:@"%lu.%lu%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion,(unsigned long)opSystVersion.patchVersion] floatValue];
    }
    return systVersionPatchFloat;
}

#pragma mark -

+(BOOL)systemVersionPriorTo:(NSString*)systemVersion
{
    float testVersion = [systemVersion floatValue];
    return [MFSystem systemVersionFloat]<testVersion;
}

+(BOOL)systemVersionPriorOrEqualTo:(NSString*)systemVersion
{
    float testVersion = [systemVersion floatValue];
    return [MFSystem systemVersionFloat]<=testVersion;
}

+(BOOL)systemVersionEqualTo:(NSString*)systemVersion
{
    float testVersion = [systemVersion floatValue];
    return [MFSystem systemVersionFloat]==testVersion;
}

@end
