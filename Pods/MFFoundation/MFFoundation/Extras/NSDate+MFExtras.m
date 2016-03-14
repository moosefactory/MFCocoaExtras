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

#import "NSDate+MFExtras.h"

@implementation NSDate (MFExtras)

-(NSDate*)dateByClearingTime
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth+NSCalendarUnitQuarter+NSCalendarUnitWeekday+NSCalendarUnitWeekdayOrdinal+NSCalendarUnitYearForWeekOfYear+NSCalendarUnitTimeZone+NSCalendarUnitEra fromDate:self];
    return [cal dateFromComponents:comps];
}

-(NSDate*)dateBySettingHour:(NSUInteger)hour minute:(NSUInteger)minute
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth+NSCalendarUnitQuarter+NSCalendarUnitWeekday+NSCalendarUnitWeekdayOrdinal+NSCalendarUnitYearForWeekOfYear+NSCalendarUnitTimeZone+NSCalendarUnitEra fromDate:self];
    comps.hour = hour;
    comps.minute = minute;
    return [cal dateFromComponents:comps];
}

-(BOOL)isSameDayAsDate:(NSDate*)date
{
    if (date==NULL) {
        NSLog(@"Date is NULL...");
        return false;
    }
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* selfcomps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth fromDate:self];
    NSDateComponents* datecomps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth fromDate:date];
    return (selfcomps.year==datecomps.year) && (selfcomps.month==datecomps.month) && (selfcomps.day==datecomps.day);
}

-(BOOL)isSameMonthAsDate:(NSDate*)date
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* selfcomps = [cal components:NSCalendarUnitYear+NSCalendarUnitMonth fromDate:self];
    NSDateComponents* datecomps = [cal components:NSCalendarUnitYear+NSCalendarUnitMonth fromDate:date];
    return (selfcomps.year==datecomps.year) && (selfcomps.month==datecomps.month);
}

-(NSDate*)oneMonthLater
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:self options:0];
}

-(NSDate*)oneMonthEarlier
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:self options:0];
}

-(NSDate*)oneDayEarlier
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:self options:0];
}

-(NSDate*)oneDayLater
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitDay value:1 toDate:self options:0];
}


-(NSUInteger)secondsSinceStartOfDay
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitHour+NSCalendarUnitMinute+NSCalendarUnitSecond fromDate:self];
    return ( comps.hour * 60 + comps.minute ) * 60 + comps.second;
}

-(NSDateComponents*)components
{
    return [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitYear+NSCalendarUnitMonth+NSCalendarUnitDay+NSCalendarUnitHour+NSCalendarUnitMinute+NSCalendarUnitSecond+NSCalendarUnitTimeZone+NSCalendarUnitWeekday+NSCalendarUnitWeekdayOrdinal fromDate:self];
}

@end
