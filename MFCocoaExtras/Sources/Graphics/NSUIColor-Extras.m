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

#import "NSUIColor-Extras.h"

@implementation NSUIColor (Extras)

-(NSString*)hexValueString
{
	long value = [self longValue];
	NSString*	outString = [NSString stringWithFormat:@"%lx", value];
	return outString;
}

-(NSString*)webColorString
{
	long value = [self longValue];
	NSString*	outString = [NSString stringWithFormat:@"#%.6lx", value & 0x00FFFFFF];
	return outString;
}

-(NSNumber*)longNumber
{
	return [NSNumber numberWithLong:[self longValue]];
}

-(long)longValue
{
	CGFloat	comps[4];
#if TARGET_OS_IPHONE
    [self getRed:&comps[0] green:&comps[1] blue:&comps[2] alpha:&comps[03]];
#else
	NSUIColor *genericColor = [self colorUsingColorSpace:[NSUIColorSpace deviceRGBColorSpace]];
	[ genericColor getComponents:comps ];    
#endif
	// Convert to ARGB
	long r = lroundf(comps[0]*255.0f);
	long g = lroundf(comps[1]*255.0f);
	long b = lroundf(comps[2]*255.0f);
	long a = lroundf(comps[3]*255.0f);
	long value = (r<<16) | (g<<8) | b | (a<<24);
	return value;
}

+(NSUIColor*)colorWithLongValue:(long)inValue
{
	float	comps[4];
	comps[0] = ( ( inValue & 0x00FF0000 ) >> 16 ) / 255.0f;
	comps[1] = ( ( inValue & 0x0000FF00 ) >> 8 ) / 255.0f;
	comps[2] = ( inValue & 0x000000FF ) / 255.0f;
	comps[3] = ( ( inValue & 0xFF000000 ) >> 24 ) / 255.0f;
	
#if TARGET_OS_IPHONE
    return [ NSUIColor colorWithRed:comps[0] green:comps[1] blue:comps[2] alpha:comps[3] ];
#else
	return [ NSUIColor colorWithDeviceRed:comps[0] green:comps[1] blue:comps[2] alpha:comps[3] ];
#endif
}

+(NSUIColor*)colorWithLongABGRValue:(long)inValue
{
	float	comps[4];
	comps[1] = ( ( inValue & 0x00FF0000 ) >> 16 ) / 255.0f;
	comps[2] = ( ( inValue & 0x0000FF00 ) >> 8 ) / 255.0f;
	comps[3] = ( inValue & 0x000000FF ) / 255.0f;
	comps[0] = ( ( inValue & 0xFF000000 ) >> 24 ) / 255.0f;
	
#if TARGET_OS_IPHONE
    return [ NSUIColor colorWithRed:comps[0] green:comps[1] blue:comps[2] alpha:comps[3] ];
#else
	return [ NSUIColor colorWithDeviceRed:comps[0] green:comps[1] blue:comps[2] alpha:comps[3] ];
#endif
}


+(NSUIColor*)colorWithLongNumber:(NSNumber*)inNumber
{
	return [NSUIColor colorWithLongValue: inNumber ? [inNumber longValue] : 0 ];
}

+(NSUIColor*)colorWithHexString:(NSString*)hexValue
{
    if (hexValue.length<10) hexValue = [hexValue stringByAppendingString:@"FF"]; // Add alpha component
    NSScanner* scanner = [NSScanner scannerWithString:hexValue];
    unsigned long long value;
    [scanner scanHexLongLong:&value];
    
	return [NSUIColor colorWithLongABGRValue: (long)value ];
}

-(NSString*)componentsString
{
	CGFloat	comps[4];
#if TARGET_OS_IPHONE
    [self getRed:&comps[0] green:&comps[1] blue:&comps[2] alpha:&comps[03]];
#else
	NSUIColor *genericColor = [self colorUsingColorSpace:[NSUIColorSpace deviceRGBColorSpace]];
	[ genericColor getComponents:comps ];
#endif
	return [ NSString stringWithFormat:@"%0.2f,%0.2f,%0.2f,%0.2f", comps[0], comps[1], comps[2], comps[3] ];
}

#pragma mark ---- Comparators ----

-(NSComparisonResult)compareByLightness:(NSUIColor*)color
{
	if (!color) return NSOrderedAscending;
#if TARGET_OS_IPHONE
    CGFloat hue,alpha,sat;
    CGFloat bright1 = [self getHue:&hue saturation:&sat brightness:&bright1 alpha:&alpha];
	CGFloat bright2 = [self getHue:&hue saturation:&sat brightness:&bright2 alpha:&alpha];
#else
    CGFloat bright1 = [[self colorUsingColorSpace:[NSUIColorSpace genericGrayColorSpace]] brightnessComponent];
	CGFloat bright2 = [[color colorUsingColorSpace:[NSUIColorSpace genericGrayColorSpace]]  brightnessComponent];
#endif
	if (bright1 < bright2) return NSOrderedAscending;
	else if (bright1 > bright2) return NSOrderedDescending;
	else return NSOrderedSame;		
}

-(NSComparisonResult)compareByHue:(NSUIColor*)color
{
	if (!color) return NSOrderedAscending;
#if TARGET_OS_IPHONE
    CGFloat bright,alpha,sat;
    CGFloat hue1 = [self getHue:&hue1 saturation:&sat brightness:&bright alpha:&alpha];
	CGFloat hue2 = [self getHue:&hue2 saturation:&sat brightness:&bright alpha:&alpha];
#else
	CGFloat hue1 = [self hueComponent];
	CGFloat hue2 = [color hueComponent];
#endif
	if (hue1 < hue2) return NSOrderedAscending;
	else if (hue1 > hue2) return NSOrderedDescending;
	else return NSOrderedSame;		
}

-(NSComparisonResult)compareBySaturation:(NSUIColor*)color
{
	if (!color) return NSOrderedAscending;
#if TARGET_OS_IPHONE
    CGFloat bright,alpha,hue;
    CGFloat sat1 = [self getHue:&hue saturation:&sat1 brightness:&bright alpha:&alpha];
	CGFloat sat2 = [self getHue:&hue saturation:&sat2 brightness:&bright alpha:&alpha];
#else
	CGFloat sat1 = [self hueComponent];
	CGFloat sat2 = [color hueComponent];
#endif
	if (sat1 < sat2) return NSOrderedAscending;
	else if (sat1 > sat2) return NSOrderedDescending;
	else return NSOrderedSame;		
}

#pragma mark ---- Utilities -----

-(NSUIColor*)colorWithNoAlpha
{
    CGFloat red,green,blue,alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    return [NSUIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

-(NSUIColor*)colorWithAlphaComponentMultipliedBy:(CGFloat)factor
{
    CGFloat red,green,blue,alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    alpha = alpha*0.8;
    return [NSUIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end

