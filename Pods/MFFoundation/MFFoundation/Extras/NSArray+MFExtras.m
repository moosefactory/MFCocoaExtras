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

#import "NSArray+MFExtras.h"

@implementation NSArray (MFExtras)

-(NSArray*)arrayByRemovingLastObject
{
    NSUInteger count = self.count;
    if (count==0) return self;
    count--;
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:count];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx<count) [array addObject:obj];
    }];
    return [NSArray arrayWithArray:array];
}

-(NSArray*)arrayByRemovingFirstObject
{
    if (self.count==0) return self;
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:self.count-1];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx>0) [array addObject:obj];
    }];
    return [NSArray arrayWithArray:array];
}

-(NSArray*)alphabeticallySortedArray
{
    return [self sortedArrayUsingComparator:^(id obj1, id obj2) {
        return  [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
}

@end
