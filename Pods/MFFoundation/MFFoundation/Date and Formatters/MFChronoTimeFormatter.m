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

#import "MFChronoTimeFormatter.h"


@implementation MFChronoTimeFormatter

-(NSString*)stringForObjectValue:(id)object
{
	long time=[object longValue];
	long	time_sec = time / 10;
	long h = time_sec / 3600;
	time_sec -= h*3600;
	long m = time_sec / 60;
	time_sec -= m*60;
	long s = time_sec;
	
	NSString	*timeStr = [[NSString alloc] init];
	if ( h > 0 ) timeStr = [timeStr stringByAppendingFormat:@"%li:",h];
	if ( m > 0 ) timeStr = [timeStr stringByAppendingFormat:@"%02li:",m];
	timeStr = [timeStr stringByAppendingFormat:@"%02li.%li",s,time%10];

	return timeStr;
}

@end
