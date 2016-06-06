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

#ifndef MoofLibrary_MoofNSUITypes_h
#define MoofLibrary_MoofNSUITypes_h

#import <Foundation/NSObject.h>

#if TARGET_OS_IPHONE
    #import <UIKit/UIKit.h>

    #define NSUIRect            CGRect

    #define NSUIColor           UIColor
    #define NSUIColorSpace      UIColorSpace

    #define NSUIImage           UIImage

    #define NSUIFont            UIFont
    #define NSUIButton          UIButton
    #define NSUIControl         UIControl
    #define NSUILabel           UILabel
    #define NSUIView            UIView
    #define NSUIViewController  UIViewController
#else
    #import <Cocoa/Cocoa.h>

    #define NSUIRect            NSRect

    #define NSUIColor           NSColor
    #define NSUIColorSpace      NSColorSpace

    #define NSUIImage           NSImage

    #define NSUIFont            NSFont
    #define NSUIControl         NSControl
    #define NSUIButton          NSButton
    #define NSUILabel           NSTextField
    #define NSUIView            NSView
    #define NSUIViewController  NSViewController
#endif

#endif
