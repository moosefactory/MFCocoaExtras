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

#include "MFMathUtilities.h"

const   float kPiOnThree = M_PI / 3.0f;
const   float kTwoPiOnThree = 2.0f * kPiOnThree;

extern float MF_clampOne(float f) {
    if (f<=0.0f) return 0.0f;
    if (f>=1.0f) return 1.0f;
    return f;
}

extern float MF_modf(float x,float d)
{
    long n = x / d;
    return x - n * d;
}

extern float MF_clampAngle(float angle) {
    long n = angle / (2*M_PI);
    if (angle<0.0f) {
        return angle + (n+1)*2 * M_PI;
    }
    return angle - n *2* M_PI;;
}

extern void MF_cartesianToPolar(float x,float y, float* teta,float *phi)
{
    *teta = atan2f( y, x );
    *phi = sqrtf( x * x + y * y );
}

extern void MF_polarToCartesian(float teta,float phi,float *x, float *y)
{
    *x = cosf(teta)*phi;
    *y = sinf(teta)*phi;
}


#pragma mark - Positive (0..1) trigo Computation

extern double mfpsin(double angle)
{
    return ( sin(angle) + 1.0f ) / 2.0f;
}

extern double mfpcos(double angle)
{
    return ( cos(angle) + 1.0f ) / 2.0f;
}

#pragma mark - Min/Max Computation

extern float MF_maxf(float f1, float f2)
{
    if ( f1 > f2 ) return f1;
    return f2;
}

extern float MF_minf(float f1, float f2)
{
    if ( f1 < f2 ) return f1;
    return f2;
}

extern float MF_max3f(float f1, float f2, float f3)
{
    if ( f1 > f2 ) {
        if ( f1 > f3 ) return f1;
        else {
            if (f3 > f2) {
                return f3;
            }
        }
    }
    return f2;
}

extern float MF_min3f(float f1, float f2, float f3)
{
    if ( f1 < f2 ) {
        if ( f1 < f3 ) return f1;
        else {
            if (f3 < f2) {
                return f3;
            }
        }
    }
    return f2;
}
