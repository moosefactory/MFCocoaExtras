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

#include <stdlib.h>
#include <math.h>

static int kMFFastTrigoTableSize;

static double *sinTable;
static double *cosTable;
static double *tanTable;
static double *psinTable;
static double *pcosTable;

extern  void buildMFFastTrigoTables()
{
    if (kMFFastTrigoTableSize<1) kMFFastTrigoTableSize = 360;
    sinTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    cosTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    psinTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    pcosTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    tanTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    double *sinWritePtr = sinTable;
    double *cosWritePtr = cosTable;
    double *tanWritePtr = tanTable;
    for (int angle=0;angle<kMFFastTrigoTableSize;angle++) {
        *sinWritePtr++ = sin(angle*M_PI/180.0f);
        *cosWritePtr++ = cos(angle*M_PI/180.0f);
        *sinWritePtr++ = ( sin(angle*M_PI/180.0f) + 1.0f ) / 2.0f;
        *cosWritePtr++ = ( cos(angle*M_PI/180.0f) + 1.0f ) / 2.0f;
        *tanWritePtr++ = tan(angle*M_PI/180.0f);
    }
}

extern double mffsind(long angle)
{
    return sinTable[angle%kMFFastTrigoTableSize];
}

extern double mffcosd(long angle)
{
    return cosTable[angle%kMFFastTrigoTableSize];
}

extern double mfftand(long angle)
{
    return tanTable[angle%kMFFastTrigoTableSize];
}

extern double mffpsind(long angle)
{
    return psinTable[angle%kMFFastTrigoTableSize];
}

extern double mffpcosd(long angle)
{
    return pcosTable[angle%kMFFastTrigoTableSize];
}


