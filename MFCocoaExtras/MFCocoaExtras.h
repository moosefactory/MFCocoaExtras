/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - v1.0.0                 */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2016 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/
/*
**Copyright (c) 2016 Tristan Leblanc - MooseFactory Software <tristan@moosefactory.eu>**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/


//! Project version number for MFCocoaExtras.
FOUNDATION_EXPORT double MFCocoaExtrasVersionNumber;

//! Project version string for MFCocoaExtras.
FOUNDATION_EXPORT const unsigned char MFCocoaExtrasVersionString[];

#import "TargetConditionals.h" 

// Cocoa Touch Extras
#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

#if TARGET_OS_IPHONE

#import <MFCocoaExtras/UIBarButtonItem+Extras.h>
#import <MFCocoaExtras/UIButton+Extras.h>
#import <MFCocoaExtras/UIImage+Extras.h>
#import <MFCocoaExtras/UIView+Extras.h>

#endif

// Graphics

#import <MFCocoaExtras/CGExtras.h>
#import <MFCocoaExtras/NSUIColor-Extras.h>
#import <MFCocoaExtras/MFNSUITypes.h>

// Security

#import <MFCocoaExtras/MFSecurity.h>
