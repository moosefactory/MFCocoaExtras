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

#import <MFCocoaExtras/MFCGCombinedColor.h>
#import <MFFoundation/MFMathUtilities.h>

const MFCGFloat MFCG_BlackColor[] = {0.0f, 0.0f, 0.0f, 1.0f };
const MFCGFloat MFCG_DarkGrayColor[] = {0.25f, 0.25f, 0.25f, 1.0f };
const MFCGFloat MFCG_GrayColor[] = {0.50f, 0.50f, 0.50f, 1.0f };
const MFCGFloat MFCG_LightGrayColor[] = {0.75f, 0.75f, 0.75f, 1.0f };
const MFCGFloat MFCG_WhiteColor[] = {1.0f, 1.0f, 1.0f, 1.0f };

const MFCGFloat MFCG_BlueColor[] = {0.0f, 0.0f, 1.0f, 1.0f };
const MFCGFloat MFCG_RedColor[] = {1.0f, 0.0f, 0.0f, 1.0f };
const MFCGFloat MFCG_GreenColor[] = {0.0f, 1.0f, 0.0f, 1.0f };

const MFCGFloat MFCG_BlackColor_A50[] = {0.0f, 0.0f, 0.0f, 0.5f };
const MFCGFloat MFCG_WhiteColor_A50[] = {1.0f, 1.0f, 1.0f, 0.5f };
const MFCGFloat MFCG_BlackColor_A75[] = {0.0f, 0.0f, 0.0f, 0.75f };
const MFCGFloat MFCG_WhiteColor_A75[] = {1.0f, 1.0f, 1.0f, 0.75f };
const MFCGFloat MFCG_BlackColor_A25[] = {0.0f, 0.0f, 0.0f, 0.25f };
const MFCGFloat MFCG_WhiteColor_A25[] = {1.0f, 1.0f, 1.0f, 0.25f };

void MFCGCombinedColorSetRGBA(MFCGCombinedColor *combinedColor, MFCGFloat r,MFCGFloat g,MFCGFloat b,MFCGFloat a)
{
    combinedColor->r = MF_clampOne(r);
    combinedColor->g = MF_clampOne(g);
    combinedColor->b = MF_clampOne(b);
    combinedColor->a = MF_clampOne(a);
    
    MFCGRGBToHSL(combinedColor->r,combinedColor->g,combinedColor->b,&combinedColor->h,&combinedColor->s,&combinedColor->l);
}

void MFCGCombinedColorSetHSL(MFCGCombinedColor *combinedColor, MFCGFloat h,MFCGFloat s,MFCGFloat l)
{
    combinedColor->h = MF_clampAngle(h);
    combinedColor->s = MF_clampOne(s);
    combinedColor->l = MF_clampOne(l);
    
    MFCGHSLToRGB(combinedColor->h,combinedColor->s,combinedColor->l,&(combinedColor->r),&(combinedColor->g),&(combinedColor->b));
}

void MFCGRGBToHSL(MFCGFloat r,MFCGFloat g,MFCGFloat b,MFCGFloat *h,MFCGFloat *s,MFCGFloat *l)
{
    MFCGFloat lightness = ( MF_max3f(r, g, b) +  MF_min3f(r, g, b)) / 2;
    MFCGFloat saturation;
    
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
    
    MFCGFloat hue;
    if (r == g && g == b ) {
        hue = 0;
    } else
        if ( g >= r && g >= b ) {
            if (r > b)
                hue = MF_TwoPiOnThree - MF_PiOnThree * (r - b) / (g - b);
            else
                hue = MF_TwoPiOnThree + MF_PiOnThree * (b - r) / (g - r);
        } else
            if (b >= r && b >= g) {
                if (g > r)
                    hue = 2*MF_TwoPiOnThree - MF_PiOnThree * (g - r) / (b - r);
                else
                    hue = 2*MF_TwoPiOnThree + MF_PiOnThree * (r - g) / (b - g);
            } else
                if (b > g)
                    hue = 2*M_PI - MF_PiOnThree * (b - g) / (r - g);
                else
                    hue = MF_PiOnThree * (g - b) / (r - b);
    
    //    NSLog(@"RGB To HSL : { %3.3f,3.3%f,%3.3f } -> { %3.3f,3.3%f,%3.3f } ",r,g,b,*h,*s,*l);
    *s = saturation;
    *l = lightness;
    *h = hue;
}

void MFCGHSLToRGB(MFCGFloat h,MFCGFloat s,MFCGFloat l,MFCGFloat *r,MFCGFloat *g,MFCGFloat *b)
{
    MFCGFloat red = 0.0f;
    MFCGFloat green = 0.0f;
    MFCGFloat blue = 0.0f;
    
    MFCGFloat divAngle = MF_clampAngle(h) / MF_PiOnThree;
    // HSV // MFCGFloat chroma = ( 1 - fabsf( 2 * lightness ));
    MFCGFloat chroma = ( 1 - fabs( 2 * l - 1 ) ) * s;
    MFCGFloat x = chroma * ( 1 - fabsf( MF_modf( divAngle , 2 ) - 1));
    MFCGFloat m = l - chroma / 2.0f;
    
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
