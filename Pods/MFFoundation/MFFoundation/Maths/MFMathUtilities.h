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

#include <stdio.h>
#include <math.h>

#ifdef __cplusplus
extern "C" {
#endif

extern  const float kPiOnThree;
extern  const float kTwoPiOnThree;

float MF_clampOne(float f);
float MF_modf(float x,float d);
float MF_clampAngle(float angle);

double mfpsin(double angle);
double mfpcos(double angle);

float MF_maxf(float f1, float f2);
float MF_minf(float f1, float f2);

float MF_max3f(float f1, float f2, float f3);
float MF_min3f(float f1, float f2, float f3);

void MF_cartesianToPolar(float x,float y, float* teta,float *phi);
void MF_polarToCartesian(float teta,float phi,float *x, float *y);

#ifdef __cplusplus
}
#endif


