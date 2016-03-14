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

#import "CGExtras.h"


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