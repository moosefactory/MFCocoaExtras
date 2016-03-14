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

#import "NSDictionary+MFExtras.h"
#import "NSArray+MFExtras.h"

@implementation NSDictionary (MFExtras)

+(NSDictionary*)dictionaryWithName:(NSString*)name
{
    return [NSDictionary dictionaryWithName:name type:@"plist"];
}

+(NSDictionary*)dictionaryWithName:(NSString*)name type:(NSString*)type
{
    NSDictionary    *dict = NULL;
    NSURL           *dictURL = [[NSBundle mainBundle] URLForResource:name withExtension:type];

    if (dictURL) {
        dict = [NSDictionary dictionaryWithContentsOfURL:dictURL];
    }
    
    return dict;
}

+(NSDictionary*)localizedDictionaryWithName:(NSString*)name
{
    return [NSDictionary localizedDictionaryWithName:name type:@"plist"];
}

+(NSDictionary*)localizedDictionaryWithName:(NSString*)name type:(NSString*)type
{
    NSDictionary    *localizedDict = NULL;
    NSString        *localizationName = [[NSLocale preferredLanguages] objectAtIndex:0];
    //[[NSLocale autoupdatingCurrentLocale] objectForKey:NSLocaleLanguageCode];
    NSURL           *localizedDictURL = [[NSBundle mainBundle] URLForResource:name withExtension:type subdirectory:[NSString stringWithFormat:@"%@.lproj",localizationName]];
    // If resource doe not exist, we try at root ( resource must have a 'base' localization, or not being localized )
    if (!localizedDictURL) {
        localizedDictURL = [[NSBundle mainBundle] URLForResource:name withExtension:type];
    }
    
    if (localizedDictURL) {
        localizedDict = [NSDictionary dictionaryWithContentsOfURL:localizedDictURL];
    }
    
    return localizedDict;
}

-(NSArray*)alphabeticallySortedKeys
{
    return [[self allKeys] alphabeticallySortedArray];
}

@end

