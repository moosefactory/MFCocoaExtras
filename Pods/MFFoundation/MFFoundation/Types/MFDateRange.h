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

@interface MFDateRange : NSObject

+(id)dateRangeWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;
-(id)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;

+(id)dateRangeWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute;
-(id)initWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute;

-(BOOL)containsDayWithComponents:(NSDateComponents*)comps inCalendar:(NSCalendar*)cal;
-(BOOL)containsDate:(NSDate*)date;

-(void)startHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes;
-(void)endHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes;


-(NSTimeInterval)duration;

@property(nonatomic,strong) NSDate* startDate;
@property(nonatomic,strong) NSDate* endDate;

@property(nonatomic,assign) NSUInteger  startHour;
@property(nonatomic,assign) NSUInteger  endHour;

@end
