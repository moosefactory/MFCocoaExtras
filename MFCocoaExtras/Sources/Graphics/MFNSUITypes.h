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

#ifndef MoofLibrary_MoofNSUITypes_h
#define MoofLibrary_MoofNSUITypes_h

#import <Foundation/NSObject.h>

#if TARGET_OS_IPHONE
    #import <UIKit/UIKit.h>

    #define NSUIColor           UIColor
    #define NSUIColorSpace      UIColorSpace

    #define NSUIImage           UIImage

    #define NSUIFont            UIFont
    #define NSUIControl         UIControl
    #define NSUILabel           UILabel
    #define NSUIView            UIView
    #define NSUIViewController  UIViewController
#else
    #import <Cocoa/Cocoa.h>

    #define NSUIColor           NSColor
    #define NSUIColorSpace      NSColorSpace

    #define NSUIImage           NSImage

    #define NSUIFont            NSFont
    #define NSUIControl         NSControl
    #define NSUILabel           NSTextField
    #define NSUIView            NSView
    #define NSUIViewController  NSViewController
#endif

#endif
