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
