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

#import "MFDateRange.h"

@implementation MFDateRange

+(id)dateRangeWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    MFDateRange* dateRange = [[MFDateRange alloc] initWithStartDate:startDate endDate:endDate];
    return dateRange;
}

-(id)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    if (self = [super init]) {
        self.startDate = startDate;
        self.endDate = endDate;
    }
    return self;
}

+(id)dateRangeWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    
    MFDateRange* dateRange = [[MFDateRange alloc] initWithDayDate:dayDate startHour:startHour startMinute:startMinute endHour:endHour endMinute:endMinute];
    return dateRange;
}

-(id)initWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:dayDate];
    comps.minute = startMinute;
    comps.hour = startHour;
    NSDate* startDate = [cal dateFromComponents:comps];
    comps.hour = endHour;
    comps.minute = endMinute;
    NSDate* endDate = [cal dateFromComponents:comps];

    return [self initWithStartDate:startDate endDate:endDate];
}

-(BOOL)containsDayWithComponents:(NSDateComponents*)comps inCalendar:(NSCalendar*)cal
{
    NSDateComponents* sc = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:self.startDate];
    NSDateComponents* ec = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:self.endDate];
    if ( (sc.year<=comps.year) && (ec.year>=comps.year) ) {
        if ( (sc.month<=comps.month) && (ec.month>=comps.month) ) {
            if ( (sc.day<=comps.day) && (ec.day>=comps.day) ) {
                        return YES;
            }
        }
    }
    return NO;
}

-(BOOL)containsDate:(NSDate*)date
{
    NSInteger i1 = [date timeIntervalSinceDate:self.startDate];
    NSInteger i2 = [date timeIntervalSinceDate:self.endDate];
    
    return( (i1>0) && (i2<0) );
}


-(id)copy
{
    MFDateRange* newDateRange = [MFDateRange dateRangeWithStartDate:self.startDate endDate:self.endDate];
    return newDateRange;
}

-(void)startHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.startDate];
    *hours = [comps hour];
    *minutes = [comps minute];
}

-(void)endHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.endDate];
    *hours = [comps hour];
    *minutes = [comps minute];
}

-(NSTimeInterval)duration
{
    if (!self.startDate || !self.endDate) return INT64_MAX;
    return [self.endDate timeIntervalSinceDate:self.startDate];
}

@end
