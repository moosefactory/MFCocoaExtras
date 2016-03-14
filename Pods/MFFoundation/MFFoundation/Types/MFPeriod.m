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

#import "MFPeriod.h"


@implementation MFPeriod

+(id)periodWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    MFPeriod* period = [[MFPeriod alloc] initWithStartDate:startDate endDate:endDate];
    return period;
}

-(id)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    if (self = [super init]) {
        self.dateRange = [MFDateRange dateRangeWithStartDate:startDate endDate:endDate];
        self.periodicity = 0;
    }
    return self;
}

-(id)init
{
    if (self = [super init]) {
        self.dateRange = [[MFDateRange alloc] init];
    }
    return self;
}

+(id)periodWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    MFPeriod* period = [[MFPeriod alloc] initWithDayDate:dayDate startHour:startHour startMinute:startMinute endHour:endHour endMinute:endMinute];
    return period;
}

-(id)initWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    if (self = [super init]) {
        self.dateRange = [MFDateRange dateRangeWithDayDate:dayDate startHour:startHour startMinute:startMinute endHour:endHour endMinute:endMinute];
        self.periodicity = 0;
    }
    return self;
}

-(id)copy
{
    MFPeriod* newPeriod = [MFPeriod periodWithStartDate:self.dateRange.startDate endDate:self.dateRange.endDate];
    newPeriod.periodicity = self.periodicity;
    return newPeriod;
}

-(BOOL)containsDate:(NSDate*)date master:(BOOL*)master
{
    if (date) {
        NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
        NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear+NSCalendarUnitHour+NSCalendarUnitMinute fromDate:date];
        NSDateComponents* sc = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear+NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.dateRange.startDate];
        NSDateComponents* ec = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear+NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.dateRange.endDate];
        MFDateRange *range = [self.dateRange copy];

        if (sc.day>comps.day) return NO;
        NSUInteger  periodDays = ec.day-sc.day;
        NSUInteger  deltaDays = [date timeIntervalSinceDate:self.dateRange.startDate] / (24*60*60);
        NSUInteger  deltaMod7 = deltaDays % 7;
        if ([range containsDayWithComponents:comps inCalendar:cal]) {
            *master = YES;
            return YES;
        }
        *master = NO;
        if (self.periodicity==24*60*60) {
            return YES;
        }
        if (self.periodicity==7*24*60*60) {
            return deltaMod7<=periodDays;
        }
    }
    return NO;
}

@end
