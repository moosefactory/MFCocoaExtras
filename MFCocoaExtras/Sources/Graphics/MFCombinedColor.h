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

#ifndef MooseFactoryFramework_MFCombinedColor_h
#define MooseFactoryFramework_MFCombinedColor_h


extern const float kMFBlackColor[];
extern const float kMFDarkGrayColor[];
extern const float kMFGrayColor[];
extern const float kMFLightGrayColor[];
extern const float kMFWhiteColor[];

extern const float kMFBlueColor[];
extern const float kMFRedColor[];
extern const float kMFGreenColor[];

extern const float kMFBlackColor_A50[];
extern const float kMFWhiteColor_A50[];
extern const float kMFBlackColor_A75[];
extern const float kMFWhiteColor_A75[];
extern const float kMFBlackColor_A25[];
extern const float kMFWhiteColor_A25[];


typedef struct {
    float r,g,b;
    float a;
    float h,s,l;
} MFCGICombinedColor;


void MFCGICombinedColorSetRGBA(MFCGICombinedColor *combinedColor, float r,float g,float b,float a);
void MFCGICombinedColorSetHSL(MFCGICombinedColor *combinedColor, float h,float s,float l);

void RGBToHSL(float r,float g,float b,float *h,float *s,float *l);
void HSLToRGB(float h,float s,float l,float *r,float *g,float *b);

#endif
