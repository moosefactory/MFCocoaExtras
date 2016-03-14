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

#import <CoreLocation/CoreLocation.h>
#import "MFLatLongFormatter.h"

static NSArray* cardinals;

@implementation MFLatLongFormatter

@synthesize format;

+(void)initialize
{
    if (!cardinals) {
        NSString* cardinalsString = [self cardinalsString];
        cardinals = [cardinalsString componentsSeparatedByString:@"-"];
    }
}

+(NSString*)cardinalsString
{
    return @"N-NE-E-SE-S-SW-W-NW";
}

- (NSString *)stringForObjectValue:(id)anObject {
    
    if (anObject==NULL) return @"No Location";
    
    if (![anObject isKindOfClass:[CLLocation class]]) {
        return @"Not a Location";
    }
    
    static NSNumberFormatter *numberFormatter = nil;
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    }
    [numberFormatter setMaximumFractionDigits:4];
    
    CLLocation *loc = (CLLocation*)anObject;
    
    NSString *string = NULL;
    
    NSString* longComponent = NULL;
    NSString* latComponent = NULL;
    NSString* degString = (format & LatLongFormatter_ShowDegree) ? @"°" : @"";
    double longitude = loc.coordinate.longitude;
    double latitude = loc.coordinate.latitude;
    if (format & LatLongFormatter_Positive) {
        if (longitude<0) longitude+=360.0f;
        if (latitude<0) latitude+=360.0f;
    }
    if (format & LatLongFormatter_DMS) {
        longComponent = [MFLatLongFormatter degreeToLatitude:loc.coordinate.latitude],
        latComponent = [MFLatLongFormatter degreeToLongitude:loc.coordinate.longitude];
    } else
        if (format & LatLongFormatter_EW) {
            NSString* cardinalString;
            if (longitude<0) {
                cardinalString = cardinals[6];
                longitude = -longitude;
            } else {
                cardinalString = cardinals[2];
            }
            longComponent = [NSString stringWithFormat:@"%@%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:longitude]],degString,cardinalString];
            
            if (latitude<0) {
                cardinalString = cardinals[4];
                latitude = -latitude;
            } else {
                cardinalString = cardinals[0];
            }
            latComponent = [NSString stringWithFormat:@"%@%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:latitude]],degString,cardinalString];
        } else {
            longComponent = [NSString stringWithFormat:@"%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:longitude]],degString];
            latComponent = [NSString stringWithFormat:@"%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:latitude]],degString];
        }
    
    switch (format) {
        case LatLongFormatter_CommaSeparated:
            string =[NSString stringWithFormat:@"%@, %@",longComponent,latComponent];
            break;
            
        case LatLongFormatter_Parameters:
            [numberFormatter setMaximumFractionDigits:10];
            string =[NSString stringWithFormat:@"lat=%@&long=%@",longComponent,latComponent];
            break;
            
        default:
            string =[NSString stringWithFormat:@"%@ %@",longComponent,latComponent];
            break;
    }
    
    return string;
    
}

+(NSString*)degreeToLatitude:(double)degFloat
{
    NSString *dms = [MFLatLongFormatter deg_to_dms:fabs(degFloat)];
    
    return [NSString stringWithFormat:@"%@%@",dms,
            (degFloat < 0) ? cardinals[4] : cardinals[0]];
    
}

+(NSString*)degreeToLongitude:(double)degFloat
{
    NSString *dms = [MFLatLongFormatter deg_to_dms:fabs(degFloat)];
    
    return [NSString stringWithFormat:@"%@%@",dms,
            (degFloat < 0) ? cardinals[6] : cardinals[2]];
    
}

+(NSString*)deg_to_dms:(double)degfloat
{
    if (degfloat < 0) return nil;
    
    double deg = floor( degfloat );
    double minfloat = 60 * ( degfloat - deg );
    double min = floor ( minfloat );
    double secfloat = 60 * ( minfloat - min );
    
    secfloat = round( secfloat );
    
    if (secfloat == 60) {
        min = min + 1;
        secfloat = 0;
    }
    
    if (min == 60) {
        deg = deg + 1;
        min = 0;
    }
    
    return [NSString stringWithFormat:@"%0.0f°%0.0f\"%0.0f'", deg, min, secfloat ];
}

@end
