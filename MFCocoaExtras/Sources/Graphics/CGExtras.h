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