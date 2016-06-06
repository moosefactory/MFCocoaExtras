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


/**
 @header MFCGCombinedColor
 @discussion Defines a combined color structure.
 
In combined color, RGB Components and HSL components stick together.
 This is an advantage in image processing algorithms. 
 Accessing Hue, Saturation and Ligthness of colors stored this way don't trigger computations.
 @updated 2016-03-20
 @author Tristan Leblanc
 @copyright 2016 Tristan Leblanc - MooseFactory Software
 @encoding utf-8
 @version 1.0.0
 @unsorted
 */

#ifndef MooseFactoryFramework_MFCGCombinedColor_h
/*!
 @define MooseFactoryFramework_MFCGCombinedColor_h
 @parseOnly
 */
#define MooseFactoryFramework_MFCGCombinedColor_h

#if defined(__LP64__) && __LP64__
# define MFCGFloat double
#else
# define MFCGFloat float
#endif

/**
 @const MFCG_BlackColor
 float components for black color
 */
extern const MFCGFloat MFCG_BlackColor[];
extern const MFCGFloat MFCG_DarkGrayColor[];
extern const MFCGFloat MFCG_GrayColor[];
extern const MFCGFloat MFCG_LightGrayColor[];
extern const MFCGFloat MFCG_WhiteColor[];

extern const MFCGFloat MFCG_BlueColor[];
extern const MFCGFloat MFCG_RedColor[];
extern const MFCGFloat MFCG_GreenColor[];

extern const MFCGFloat MFCG_BlackColor_A50[];
extern const MFCGFloat MFCG_WhiteColor_A50[];
extern const MFCGFloat MFCG_BlackColor_A75[];
extern const MFCGFloat MFCG_WhiteColor_A75[];
extern const MFCGFloat MFCG_BlackColor_A25[];
extern const MFCGFloat MFCG_WhiteColor_A25[];


/*!
 @struct MFCGCombinedColor
 Stores the color components
 */
typedef struct {
    MFCGFloat r,g,b;
    MFCGFloat a;
    MFCGFloat h,s,l;
} MFCGCombinedColor;

/**
 @function MFCGCombinedColorSetRGBA
 @abstract This function sets the RGBA components of the color.
 @discussion Setting RGBA components recomputes HSL components on the fly.
 @param combinedColor   A pointer to the combined color to set.
 @param r The red component
  @param g The green component
  @param b The blue component
  @param a The alpha component
 */
void MFCGCombinedColorSetRGBA(MFCGCombinedColor *combinedColor, MFCGFloat r,MFCGFloat g,MFCGFloat b,MFCGFloat a);
/**
 @function MFCGCombinedColorSetHSL
 @abstract This function sets the RGBA components of the color.
 @discussion Setting RGBA components recomputes HSL components on the fly.
 @param combinedColor   A pointer to the combined color to set.
 @param h The hue component
 @param s The saturation component
 @param l The lightness component
 */
void MFCGCombinedColorSetHSL(MFCGCombinedColor *combinedColor, MFCGFloat h,MFCGFloat s,MFCGFloat l);

/**
 @function MFCGRGBToHSL
 @abstract This function converts RGB Components to HSL Components.
 @discussion This function is used internally by MFCGCombinedColors, but can be used by anyone who need to convert components without using MFCGCombinedColor structure.
 @param r The red component
 @param g The green component
 @param b The blue component
 @param h A pointer to the hue component
 @param s A pointer to the saturation component
 @param l A pointer to the lightness component
 */
void MFCGRGBToHSL(MFCGFloat r,MFCGFloat g,MFCGFloat b,MFCGFloat *h,MFCGFloat *s,MFCGFloat *l);

/**
 @function MFCGHSLToRGB
 @abstract This function converts RGB Components to HSL Components.
 @discussion This function is used internally by MFCGCombinedColors, but can be used by anyone who need to convert components without using MFCGCombinedColor structure.
 @param h The hue component
 @param s The saturation component
 @param l The lightness component
 @param r A pointer to the red component
 @param g A pointer to the green component
 @param b A pointer to the blue component
 */
void MFCGHSLToRGB(MFCGFloat h,MFCGFloat s,MFCGFloat l,MFCGFloat *r,MFCGFloat *g,MFCGFloat *b);

#endif
