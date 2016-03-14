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

@interface MFSystem : NSObject

+(NSString*)machine;
+(NSString*)model;
+(NSString*)cpu;
+(NSInteger)byteorder;
+(NSString*)architecture;

+(NSString*)kernelVersion;
+(NSString*)kernelRelease;
+(NSString*)kernelRevision;

+(NSString*)systemVersion;
+(NSString*)systemVersionPatch;

+(float)systemVersionFloat;
+(float)systemVersionPatchFloat;

#pragma mark -

// There is usually no reason to compare patch version
// If you need to do it ( to go around a very particular bug for example ), compare systemVersionPatchFloat using comparison signs

+(BOOL)systemVersionPriorTo:(NSString*)systemVersion;

+(BOOL)systemVersionPriorOrEqualTo:(NSString*)systemVersion;

+(BOOL)systemVersionEqualTo:(NSString*)systemVersion;

@end
