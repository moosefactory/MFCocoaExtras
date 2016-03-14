# MFFoundation

![MacDown logo](https://www.moosefactory.eu/resources/MooseFactoryRoundLogo.png)

**Utility static library for iOS or MacOS**


This is a compilation of some of commonly used codes over the years.  
Feel free to contact me by email at <tristan@moosefactory.eu>

Cheers :)

Tristan Leblanc - MooseFactory Software  
<https://www.moosefactory.eu>

***

## Table of Content

***

[**MFExtras**](#MFExtras)  
 
* [**NSArray**](#NSArray)
* [**NSData**](#NSData)
* [**NSDate**](#NSDate)
* [**NSDictionary**](#NSDictionary)
* [**NSFileManager**](#NSFileManager)
* [**NSString**](#NSString)

***

[**Date and Formatters**](#Formatters)  
 
* [**MFChronoTimeFormatter**](#MFChronoTimeFormatter)
* [**MFDateUtils**](#MFDateUtils)
* [**MFFormatters**](#MFFormatters)
* [**MFLatLongFormatter**](#MFLatLongFormatter)

***

[**Graphics**](#Graphics)  
 
* [**CGExtras**](#CGExtras)
* [**NSUIColor-Exras**](#NSUIColor-Exras)
* [**MFCombinedColor**](#MFCombinedColor)
* [**NSUITypes**](#NSUITypes)

***

[**Types**](#Types)  
 
* [**MFTypes**](#MFTypes)
* [**MFDateRange**](#MFDateRange)
* [**MFPeriod**](#MFPeriod)

***

[**Maths**](#Maths)  
 
* [**MFTypes**](#MFTypes)
* [**MFDateRange**](#MFDateRange)
* [**MFPeriod**](#MFPeriod)

***

[**Security**](#Security)  
 
* [**MFSecurity**](#MFSecurity)

***

[**System**](#System)  
 
* [**MFSystem**](#MFSystem)

<a name="NSArray"></a>
## MFExtras

<a name="NSArray"></a>
####NSArray
    NSArray+MFExtras.h

#####arrayByRemovingLastObject
Return the array without it's last element
>-(NSArray\*)arrayByRemovingLastObject;  

#####arrayByRemovingFirstObject
Return the array without it's first element
>-(NSArray*)arrayByRemovingFirstObject;

#####alphabeticallySortedArray
Return the array sorted alphabeticaly - assuming it only contains strings
>-(NSArray*)alphabeticallySortedArray;  
  
  <a name="NSData"></a>
####NSData
    NSData+MFExtras.h

#####dataWithBytesString:
Create an NSData object filled with hexadecimal string

>+(NSData\*)dataWithBytesString:(NSString\*)bytesString;

#####bytesString
Returns NSData bytes as a 'readable' hexadecimal string

>-(NSString*)bytesString;

#####randomDataOfLength
Returns some random data. Common usage is cryptography.

>+(NSData *)randomDataOfLength:(NSUInteger)length;


<a name="NSDate"></a>
####NSDate    NSDate+MFExtras.h

#####dateByClearingTime
Returns a copy of the date with hours, minutes and seconds set to 0.

>-(NSDate*)dateByClearingTime;

#####dateBySettingHour: minute:
Returns a copy of the date with hour and minute set to passed values. seconds set to 0.

>-(NSDate*)dateBySettingHour:(NSUInteger)hour minute:(NSUInteger)minute;


#####isSameDayAsDate:
Returns true if date is the same day as passed date.

>-(BOOL)isSameDayAsDate:(NSDate*)date;

#####isSameMonthAsDate:
Returns true if date is the same month as passed date.

>-(BOOL)isSameMonthAsDate:(NSDate*)date;


#####oneMonthLater
Returns a copy of the date, one month later.

>-(NSDate*)oneMonthLater;

#####oneMonthEarlier
Returns a copy of the date, one month earlier

>-(NSDate*)oneMonthEarlier;


#####oneDayLater
Returns a copy of the date, one day Later

>-(NSDate*)oneDayLater;

#####oneDayEarlier
Returns a copy of the date, one day earlier

>-(NSDate*)oneDayEarlier;


#####secondsSinceStartOfDay
Returns the number of seconds since the beginning of the day ( midnight of previous day )

>-(NSUInteger)secondsSinceStartOfDay;

#####components
Returns date components, based on auto-updating system calendar

>-(NSDateComponents*)components;


<a name="NSDictionary"></a>
####NSDictionary    NSDictionary+MFExtras.h


#####dictionaryWithName:
Returns date components, based on auto-updating system calendar

>+(NSDictionary\*)dictionaryWithName:(NSString*)name;

#####dictionaryWithName: type:
Returns date components, based on auto-updating system calendar

>+(NSDictionary\*)dictionaryWithName:(NSString\*)name type:(NSString*)type;


#####localizedDictionaryWithName:
Returns date components, based on auto-updating system calendar

>+(NSDictionary\*)localizedDictionaryWithName:(NSString*)name;

#####localizedDictionaryWithName: type:
Returns date components, based on auto-updating system calendar

>+(NSDictionary\*)localizedDictionaryWithName:(NSString\*)name type:(NSString*)type;


#####alphabeticallySortedKeys
Returns date components, based on auto-updating system calendar

>-(NSArray*)alphabeticallySortedKeys;

<a name="NSFileManager"></a>
####NSFileManager    NSFileManager+MFExtras.h

#####isDirectoryEmpty: containsOnlyInvisibleFiles:
Returns true if a given directory is empty.
If it only contains invisible files, it returns false, but sets the boolean *containsOnlyInvisibleFiles* to true.

>-(BOOL)isDirectoryEmpty:(NSString\*)path containsOnlyInvisibleFiles:(BOOL*)containsOnlyInvisibleFiles;

<a name="NSString"></a>
####NSString    NSString+MFExtras.h

#####UUIDString
Returns the UUID of the device

>+(NSString*)UUIDString;

#####md5
Returns the md5 hash of the string

>-(NSString*)md5;

#####sha1
Returns the sha1 hash of the string

>-(NSString *)sha1;


#####isValidEmail:
Returns true if passed eMail is valid. Pass true in the strict parameter to do a strict checking

>-(BOOL)isValidEmail:(BOOL)strict;

#####isValidName
Returns true if the string is a correct name ( Roman language only )

>-(BOOL)isValidName;


#####urlEncode
Convenient function to add escape percent characters (to use in an url string)
>-(NSString*)urlEncode;

#####urlDecode
Convenient function to decode an url style string ( with escape percent characters)
>-(NSString*)urlDecode;

<a name="Graphics"></a>
##Graphics<a name="CGExtras"></a>
####CGExtras    CGExtras.h
    
<a name="Color-Extras"></a>
####Color-Extras    Color-Extras.h
    
<a name="MFCombinedColor"></a>
####MFCombinedColor    MFCombinedColor.h
    
<a name="NSUITypes"></a>
####NSUITypes    NSUITypes.h
    
<a name="Types"></a>
##Types
<a name="MFTypes"></a>
####MFTypes    MFTypes.h
    
<a name="MFDateRange"></a>
####MFDateRange    MFDateRange.h
    
<a name="MFPeriod"></a>
####MFPeriod    MFPeriod.h


<a name="Maths"></a>
##Maths
<a name="MFFastTrigo"></a>
####MFFastTrigo    MFFastTrigo.h


<a name="MFMathUtilities"></a>
####MFMathUtilities    MFMathUtilities


<a name="Security"></a>
##Security
<a name="MFSecurity"></a>
####MFSecurity    MFSecurity.h


<a name="Security"></a>
##System
<a name="MFSystem"></a>
####MFSystem    MFSystem.h

***

Preliminary document - Updated 03/13/2016