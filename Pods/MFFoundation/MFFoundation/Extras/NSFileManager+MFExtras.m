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

#import "NSFileManager+MFExtras.h"
    
@implementation NSFileManager (MFExtras)

-(BOOL)isDirectoryEmpty:(NSString*)path containsOnlyInvisibleFiles:(BOOL*)containsOnlyInvisibleFiles
{
    BOOL isDir;
    if ( [self fileExistsAtPath:path isDirectory:&isDir] ) {
        if (isDir) {
            NSError*    error;
            NSArray* contents = [self contentsOfDirectoryAtPath:path error:&error];
            if (!contents || !contents.count) return true
                ;
            for (NSString* aFolderItem in contents) {
                if ( ![self isDirectoryEmpty:[path stringByAppendingPathComponent:aFolderItem] containsOnlyInvisibleFiles:containsOnlyInvisibleFiles] ) {
                    return false;
                }
            }
            return true;
        }
        else {
            if (![[[path lastPathComponent] substringToIndex:1] isEqualToString:@"."]) {
                *containsOnlyInvisibleFiles = NO;
            }
            return false;
        }
    }
    return false;
}

@end
