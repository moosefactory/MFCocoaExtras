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
    MFDaysSelector_Monday       = 1,
    MFDaysSelector_Tuesday      = 2,
    MFDaysSelector_Wedenesday   = 4,
    MFDaysSelector_Thursday     = 8,
    MFDaysSelector_Friday       = 16,
    MFDaysSelector_Saturday     = 32,
    MFDaysSelector_Sunday       = 64
} MFDaysSelectorFlag;

typedef NSUInteger MFDaysSelectorMask;

const extern MFDaysSelectorMask    MFDaysSelectorWorkingDays;
const extern MFDaysSelectorMask    MFDaysSelectorWeekEndDays;
const extern MFDaysSelectorMask    MFDaysSelectorEveryDay;
const extern MFDaysSelectorMask    MFDaysSelectorNoDays;

@interface MFDateUtils : NSObject

// Formatters

+(NSDateFormatter*)rfc3339DateFormatter;
+(NSDateFormatter*)shortDateFormatter;

// Utils

+(NSDate*)dayStartDate;
+(NSDate*)weekStartDate;
+(NSDate*)previousWeekStartDate;
+(NSDate*)yesterdayStartDate;

+(NSDate*)beginOfMonthDateForDate:(NSDate*)date;
+(NSDate*)endOfMonthDateForDate:(NSDate*)date;


@end
