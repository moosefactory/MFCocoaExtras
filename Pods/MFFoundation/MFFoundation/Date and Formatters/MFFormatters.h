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

@interface MFMoneyFormatter : NSNumberFormatter

+(MFMoneyFormatter*)defaultMoneyFormatter;
+(MFMoneyFormatter*)moneyFormatter;

+(NSString*)stringFromFloat:(float)value;
+(NSString*)stringFromNumber:(NSNumber*)value;
-(NSString*)stringFromFloat:(float)value;

@end

@interface MFDateFormatter : NSDateFormatter

+(MFDateFormatter*)defaultDateFormatter;
+(MFDateFormatter*)dateFormatter;

+(NSString*)stringFromDate:(NSDate*)date;
-(NSString*)stringFromDate:(NSDate*)date;

@end


@interface MFTimesFormatter : NSFormatter

+(MFTimesFormatter*)defaultTimesFormatter;
+(MFTimesFormatter*)timesFormatter;

+(NSString*)stringFromInteger:(NSInteger)value;
-(NSString*)stringFromInteger:(NSInteger)value;

@property(nonatomic,strong) NSString* singular;
@property(nonatomic,strong) NSString* plural;
@property(nonatomic,strong) NSString* none;

@end
