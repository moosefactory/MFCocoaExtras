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

#import "MFFormatters.h"

static MFMoneyFormatter* sDefaultMoneyFormatter;
static MFDateFormatter* sDefaultDateFormatter;
static MFTimesFormatter* sDefaultTimesFormatter;

@implementation MFMoneyFormatter

+(MFMoneyFormatter*)defaultMoneyFormatter {
    if (!sDefaultMoneyFormatter) sDefaultMoneyFormatter = [[MFMoneyFormatter alloc] init];
    return sDefaultMoneyFormatter;
}

+(MFMoneyFormatter*)moneyFormatter
{
    MFMoneyFormatter* newFormatter = [[MFMoneyFormatter alloc] init];
    return newFormatter;
}

-(id)init
{
    if (self = [super init]) {
        NSLocale *locale = [NSLocale autoupdatingCurrentLocale];
        NSString* currencySymbol = [locale objectForKey:NSLocaleCurrencySymbol];
        self.numberStyle = kCFNumberFormatterCurrencyStyle;
        [self setCurrencySymbol:currencySymbol];
        [self setMinimumFractionDigits:0];
        [self setMaximumFractionDigits:2];
    }
    return self;
}

-(NSString*)stringFromFloat:(float)value
{
    return [self stringFromNumber:[NSNumber numberWithFloat:value]];
}

+(NSString*)stringFromFloat:(float)value
{
    return [[MFMoneyFormatter defaultMoneyFormatter] stringFromNumber:[NSNumber numberWithFloat:value]];
}

+(NSString*)stringFromNumber:(NSNumber*)value
{
    return [[MFMoneyFormatter defaultMoneyFormatter] stringFromNumber:value];
}

@end


@implementation MFDateFormatter

+(MFDateFormatter*)defaultDateFormatter {
    if (!sDefaultDateFormatter) sDefaultDateFormatter = [[MFDateFormatter alloc] init];
    return sDefaultDateFormatter;
}

+(MFDateFormatter*)dateFormatter
{
    MFDateFormatter* newFormatter = [[MFDateFormatter alloc] init];
    return newFormatter;
}

-(id)init
{
    if (self = [super init]) {
    }
    return self;
}

-(NSString*)stringFromDate:(NSDate*)date
{
    return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
}

+(NSString*)stringFromDate:(NSDate*)date
{
    return [[MFDateFormatter defaultDateFormatter] stringFromDate:date];
}

@end

@implementation MFTimesFormatter : NSFormatter

+(MFTimesFormatter*)defaultTimesFormatter {
    if (!sDefaultTimesFormatter) sDefaultTimesFormatter = [[MFTimesFormatter alloc] init];
    return sDefaultTimesFormatter;
}

+(MFTimesFormatter*)timesFormatter
{
    MFTimesFormatter* newFormatter = [[MFTimesFormatter alloc] init];
    return newFormatter;
}

-(id)init
{
    if (self = [super init]) {
        self.singular = @"Time";
        self.plural = @"Times";
        self.none = @"None";
    }
    return self;
}

-(NSString*)stringFromInteger:(NSInteger)value;
{
    if (value==0) return self.none;
    return [NSString stringWithFormat:@"%li %@",(long)value,(value>1 ? self.plural : self.singular)];
}

+(NSString*)stringFromInteger:(NSInteger)value;
{
    return [[MFTimesFormatter defaultTimesFormatter] stringFromInteger:value];
}

@end
