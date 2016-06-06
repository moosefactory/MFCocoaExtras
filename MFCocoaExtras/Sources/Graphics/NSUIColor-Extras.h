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

//#import <MFCocoaExtras/MFNSUITypes.h>
#import <MFCocoaExtras/MFNSUITypes.h>
/*
#if TARGET_OS_IPHONE
@interface UIColor (MFExtras)
#else
@interface NSColor (MFExtras)
#endif
*/
@interface NSUIColor (MFExtras)

#pragma mark ---- Value Getters ----

	-(NSString*)hexValueString;
	-(NSString*)webColorString;
	-(NSNumber*)longNumber;
	-(long)longValue;


#pragma mark ---- Static Creators with Values ----

    +(NSUIColor*)colorWithHexString:(NSString*)hexValue;
	+(NSUIColor*)colorWithLongValue:(long)inValue;
	+(NSUIColor*)colorWithLongNumber:(NSNumber*)inNumber;
	//+(NSUIColor*)colorWithCGColor:(CGColorRef)color colorSpace:(CGColorSpaceRef)colorSpace;

#pragma mark ---- Comparators ----

	-(NSComparisonResult)compareByLightness:(NSUIColor*)color;
	-(NSComparisonResult)compareByHue:(NSUIColor*)color;
	-(NSComparisonResult)compareBySaturation:(NSUIColor*)color;

#pragma mark ---- Utilities -----

    -(NSUIColor*)colorWithNoAlpha;
    -(NSUIColor*)colorWithAlphaComponentMultipliedBy:(CGFloat)factor;


@property(nonatomic,readonly) CGFloat red;
@property(nonatomic,readonly) CGFloat green;
@property(nonatomic,readonly) CGFloat blue;
@property(nonatomic,readonly) CGFloat alpha;

@end
