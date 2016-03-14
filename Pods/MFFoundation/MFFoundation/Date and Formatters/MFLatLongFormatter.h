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

#import <Foundation/Foundation.h>

typedef enum {
    LatLongFormatter_CommaSeparated = 0x00,
    LatLongFormatter_DMS            = 0x01,
    LatLongFormatter_ShowDegree     = 0x02,
    LatLongFormatter_EW             = 0x04,
    LatLongFormatter_Positive       = 0x08,
    LatLongFormatter_Parameters     = 0x10
} latLongFormatterFormat;

@interface MFLatLongFormatter : NSFormatter {
    latLongFormatterFormat	format;
    UInt16                  decimals;
}

+(NSString*)degreeToLatitude:(double)degFloat;
+(NSString*)degreeToLongitude:(double)degFloat;
+(NSString*)deg_to_dms:(double)degfloat;

@property(nonatomic,assign) latLongFormatterFormat format;

@end
