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

#import "MFDateUtils.h"

static const NSInteger MFDateSecsPerDay = 24*60*60;

const MFDaysSelectorMask    MFDaysSelectorWorkingDays = MFDaysSelector_Monday | MFDaysSelector_Tuesday | MFDaysSelector_Wedenesday | MFDaysSelector_Thursday | MFDaysSelector_Friday;
const MFDaysSelectorMask    MFDaysSelectorWeekEndDays = MFDaysSelector_Saturday | MFDaysSelector_Sunday;
const MFDaysSelectorMask    MFDaysSelectorEveryDay = MFDaysSelectorWorkingDays | MFDaysSelectorWeekEndDays;
const MFDaysSelectorMask    MFDaysSelectorNoDays = 0;

@implementation MFDateUtils

#pragma mark - Formatters

+(NSDateFormatter*)rfc3339DateFormatter
{
    static NSDateFormatter* sRFC3339DateFormatter;
    
    if (!sRFC3339DateFormatter) {
        sRFC3339DateFormatter= [[NSDateFormatter alloc] init];
        
        NSLocale* enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        
        [sRFC3339DateFormatter setLocale:enUSPOSIXLocale];
        [sRFC3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH:mm:ssZ"];
        [sRFC3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    }
    return sRFC3339DateFormatter;
}

+(NSDateFormatter*)shortDateFormatter
{
    static NSDateFormatter* sShortDateFormatter;
    
    if (!sShortDateFormatter) {
        sShortDateFormatter= [[NSDateFormatter alloc] init];
        [sShortDateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return sShortDateFormatter;
}

#pragma mark - Utils

+(NSDate*)dayStartDate
{
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comps = [cal components:kCFCalendarUnitYear|kCFCalendarUnitMonth|kCFCalendarUnitDay|kCFCalendarUnitHour|kCFCalendarUnitMinute|kCFCalendarUnitSecond fromDate:[NSDate date]];
    NSInteger hour = comps.hour;
    comps.hour = 4;
    comps.minute = 0;
    comps.second = 0;
    
    NSDate* date = [cal dateFromComponents:comps];
    if (hour<4) {
        date = [date dateByAddingTimeInterval:-MFDateSecsPerDay];
    }
#if DEBUG
    NSLog(@"Day Start :%@",date);
#endif
    return date;
}

+(NSDate*)weekStartDate
{
    NSDate* date = [ [self dayStartDate] dateByAddingTimeInterval:-7*MFDateSecsPerDay ];
#if DEBUG
    NSLog(@"Week Start :%@",date);
#endif
    return date;
}

+(NSDate*)previousWeekStartDate
{
    NSDate* date = [ [self dayStartDate] dateByAddingTimeInterval:-14*MFDateSecsPerDay ];
#if DEBUG
    NSLog(@"Previous Week Start :%@",date);
#endif
    return date;
}

+(NSDate*)yesterdayStartDate
{
    NSDate *dayStartDate = [MFDateUtils dayStartDate];
    NSDate *yesterdayStartDate = [dayStartDate dateByAddingTimeInterval:-MFDateSecsPerDay];
    return yesterdayStartDate;
}

+(NSDate*)beginOfMonthDateForDate:(NSDate*)date
{
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:date];
    comps.day = 1;
    NSDate* firstDayDate = [cal dateFromComponents:comps];
    return firstDayDate;
}


+(NSDate*)endOfMonthDateForDate:(NSDate*)date
{
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:date];
    comps.day = 1;
    NSDate* firstDayDate = [cal dateFromComponents:comps];
    NSDate* lastDayDate = [cal dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:firstDayDate options:0];
    return lastDayDate;
}

@end
