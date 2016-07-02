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

#import <MFCocoaExtras/MFCGExtras.h>


CGSize  CGSizeWithRatio(CGSize inSize,CGFloat ratio)
{
    return CGSizeMake(inSize.width*ratio, inSize.height*ratio);
}

CGSize  CGSizeWithRatios(CGSize inSize,CGFloat ratioh,CGFloat ratiov)
{
    return CGSizeMake(inSize.width*ratioh, inSize.height*ratiov);
}

CGRect  CGRectWithRatio(CGRect inRect,CGFloat ratio)
{
    CGRect r = CGRectMake(inRect.origin.x, inRect.origin.y, inRect.size.width*ratio, inRect.size.height*ratio);
    CGRectCenterOnCGRect(&r, inRect);
    return r;
}

CGRect  CGRectWithRatios(CGRect inRect,CGFloat ratioh,CGFloat ratiov)
{
    CGRect r = CGRectMake(inRect.origin.x, inRect.origin.y, inRect.size.width*ratioh, inRect.size.height*ratiov);
    CGRectCenterOnCGRect(&r, inRect);
    return r;
}

CGRect CGRectHeaderWithRatio(CGRect inRect,CGFloat ratio)
{
    CGRect r = CGRectMake(inRect.origin.x, inRect.origin.y, inRect.size.width, inRect.size.height*ratio);
    return r;
}

CGRect CGRectBottomWithRatio(CGRect inRect,CGFloat ratio)
{
    CGRect r = CGRectMake(inRect.origin.x, inRect.origin.y, inRect.size.width, inRect.size.height*ratio);
    r.origin.y = inRect.origin.y+inRect.size.height-r.size.height;
    return r;
}

CGPoint CGRectMiddle(CGRect rect)
{
    return CGPointMake(rect.origin.x+rect.size.width/2.0f,rect.origin.y+rect.size.height/2.0f);
}

void CGRectCenterOnCGRect(CGRect *rect,CGRect onRect)
{
    CGFloat dh = (onRect.size.width - (*rect).size.width)/2.0f;
    CGFloat dv = (onRect.size.height - (*rect).size.height)/2.0f;
    (*rect).origin = CGPointMake(onRect.origin.x+dh,onRect.origin.y+dv);
}

#if !TARGET_OS_IPHONE

NSSize  NSSizeWithRatio(NSSize inSize,CGFloat ratio)
{
    return NSMakeSize(inSize.width*ratio, inSize.height*ratio);
}

NSPoint NSRectMiddle(NSRect rect)
{
    return NSMakePoint(rect.origin.x+rect.size.width/2.0f,rect.origin.y+rect.size.height/2.0f);
}

void NSRectCenterOnNSRect(NSRect *rect,NSRect onRect)
{
    CGFloat dh = (onRect.size.width - (*rect).size.width)/2.0f;
    CGFloat dv = (onRect.size.height - (*rect).size.height)/2.0f;
    (*rect).origin = NSMakePoint(onRect.origin.x+dh,onRect.origin.y+dv);
}

#endif