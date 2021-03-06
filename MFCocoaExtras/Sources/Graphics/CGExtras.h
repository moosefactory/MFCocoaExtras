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

#import <Foundation/Foundation.h>

#if !BUILD_FOR_MACOS_10_7
#include <CoreGraphics/CoreGraphics.h>
#endif

#ifndef CGGEOMETRY_EXTRAS_H_
#define CGGEOMETRY_EXTRAS_H_

#pragma mark - CoreGraphics

CGSize  CGSizeWithRatio(CGSize inSize,CGFloat ratio);
CGSize  CGSizeWithRatios(CGSize inSize,CGFloat ratioh,CGFloat ratiov);

CGRect CGRectHeaderWithRatio(CGRect inRect,CGFloat ratio);
CGRect CGRectBottomWithRatio(CGRect inRect,CGFloat ratio);

CGRect  CGRectWithRatio(CGRect inRect,CGFloat ratio);
CGRect  CGRectWithRatios(CGRect inRect,CGFloat ratioh,CGFloat ratiov);

CGPoint CGRectMiddle(CGRect rect);
void CGRectCenterOnCGRect(CGRect *rect,CGRect onRect);

#pragma mark - Cocoa

#if !TARGET_OS_IPHONE

NSSize  NSSizeWithRatio(NSSize inSize,CGFloat ratio);
NSPoint NSRectMiddle(NSRect rect);
void    NSRectCenterOnNSRect(NSRect *rect,NSRect onRect);

#endif

#endif