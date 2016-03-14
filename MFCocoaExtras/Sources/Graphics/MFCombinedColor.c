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

#include <stdio.h>

#include "MFCombinedColor.h"
#include <MFFoundation/MFMathUtilities.h>

const float kMFBlackColor[] = {0.0f, 0.0f, 0.0f, 1.0f };
const float kMFDarkGrayColor[] = {0.25f, 0.25f, 0.25f, 1.0f };
const float kMFGrayColor[] = {0.50f, 0.50f, 0.50f, 1.0f };
const float kMFLightGrayColor[] = {0.75f, 0.75f, 0.75f, 1.0f };
const float kMFWhiteColor[] = {1.0f, 1.0f, 1.0f, 1.0f };

const float kMFBlueColor[] = {0.0f, 0.0f, 1.0f, 1.0f };
const float kMFRedColor[] = {1.0f, 0.0f, 0.0f, 1.0f };
const float kMFGreenColor[] = {0.0f, 1.0f, 0.0f, 1.0f };

const float kMFBlackColor_A50[] = {0.0f, 0.0f, 0.0f, 0.5f };
const float kMFWhiteColor_A50[] = {1.0f, 1.0f, 1.0f, 0.5f };
const float kMFBlackColor_A75[] = {0.0f, 0.0f, 0.0f, 0.75f };
const float kMFWhiteColor_A75[] = {1.0f, 1.0f, 1.0f, 0.75f };
const float kMFBlackColor_A25[] = {0.0f, 0.0f, 0.0f, 0.25f };
const float kMFWhiteColor_A25[] = {1.0f, 1.0f, 1.0f, 0.25f };

void MFCGICombinedColorSetRGBA(MFCGICombinedColor *combinedColor, float r,float g,float b,float a)
{
    combinedColor->r = MF_clampOne(r);
    combinedColor->g = MF_clampOne(g);
    combinedColor->b = MF_clampOne(b);
    combinedColor->a = MF_clampOne(a);
    
    RGBToHSL(combinedColor->r,combinedColor->g,combinedColor->b,&combinedColor->h,&combinedColor->s,&combinedColor->l);
}

void MFCGICombinedColorSetHSL(MFCGICombinedColor *combinedColor, float h,float s,float l)
{
    combinedColor->h = MF_clampAngle(h);
    combinedColor->s = MF_clampOne(s);
    combinedColor->l = MF_clampOne(l);
    
    HSLToRGB(combinedColor->h,combinedColor->s,combinedColor->l,&(combinedColor->r),&(combinedColor->g),&(combinedColor->b));
}

void RGBToHSL(float r,float g,float b,float *h,float *s,float *l)
{
    float lightness = ( MF_max3f(r, g, b) +  MF_min3f(r, g, b)) / 2;
    float saturation;
    
    if ( r == g && g == b ) {
        saturation = 0;
    }
    else if ( g >= r && g >= b ) {
        if ( r > b ) {
            if ( g + b > 1 ) {
                saturation = (g - b) / (2 - g - b);
            } else {
                saturation = (g - b) / (g + b);
            }
        }
        else if ( g + r > 1 ) {
            saturation = (g - r) / (2 - g - r);
        } else {
            saturation = (g - r) / (g + r);
        }
    }
    else if ( r >= b && r >= g ) {
        if ( r > g ) {
            if ( r + g > 1 ) {
                saturation = (r - g) / (2 - r - g);
            }
            else {
                saturation = (r - g) / (r + g);
            }
        }
        else if ( r + b > 1 ) {
            saturation = (r - b) / (2 - r - b);
        } else {
            saturation = (r - b) / (r + b);
        }
    }
    else if ( g > r ) {
        if ( b + r > 1 ) {
            saturation = (b - r) / (2 - b - r);
        } else {
            saturation = (b - r) / (b + r);
        }
    } else if ( b + g > 1 ) {
        saturation = (b - g) / (2 - b - g);
    } else {
        saturation = (b - g) / (b + g);
    }
    
    float hue;
    if (r == g && g == b ) {
        hue = 0;
    } else
        if ( g >= r && g >= b ) {
            if (r > b)
                hue = kTwoPiOnThree - kPiOnThree * (r - b) / (g - b);
            else
                hue = kTwoPiOnThree + kPiOnThree * (b - r) / (g - r);
        } else
            if (b >= r && b >= g) {
                if (g > r)
                    hue = 2*kTwoPiOnThree - kPiOnThree * (g - r) / (b - r);
                else
                    hue = 2*kTwoPiOnThree + kPiOnThree * (r - g) / (b - g);
            } else
                if (b > g)
                    hue = 2*M_PI - kPiOnThree * (b - g) / (r - g);
                else
                    hue = kPiOnThree * (g - b) / (r - b);
    
    //    NSLog(@"RGB To HSL : { %3.3f,3.3%f,%3.3f } -> { %3.3f,3.3%f,%3.3f } ",r,g,b,*h,*s,*l);
    *s = saturation;
    *l = lightness;
    *h = hue;
}

void HSLToRGB(float h,float s,float l,float *r,float *g,float *b)
{
    float red = 0.0f;
    float green = 0.0f;
    float blue = 0.0f;
    
    float divAngle = MF_clampAngle(h) / kPiOnThree;
    // HSV // float chroma = ( 1 - fabsf( 2 * lightness ));
    float chroma = ( 1 - fabsf( 2 * l - 1 ) ) * s;
    float x = chroma * ( 1 - fabsf( MF_modf( divAngle , 2 ) - 1));
    float m = l - chroma / 2.0f;
    
    if (divAngle >= 0.0f && divAngle < 1.0f) { // redSector
        red = chroma;
        green = x;
        blue = 0;
    }
    else
        if (divAngle >= 1.0f && divAngle < 2.0f) { // redSector
            red = x;
            green = chroma;
            blue = 0;
        }
        else
            if (divAngle >= 2.0f && divAngle < 3.0f) { // redSector
                green = chroma;
                blue = x;
            }
            else
                if (divAngle >= 3.0f && divAngle < 4.0f) { // redSector
                    green = x;
                    blue = chroma;
                }
                else
                    if (divAngle >= 4.0f && divAngle < 5.0f) { // redSector
                        red = x;
                        blue = chroma;
                    }
                    else
                        if (divAngle >= 5.0f && divAngle < 6.0f) { // redSector
                            blue = x;
                            red = chroma;
                        }
    
    
    *r = (red + m);
    *g = (green + m);
    *b = (blue + m);
    
}
