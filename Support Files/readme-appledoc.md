# MFCocoaExtras

![MacDown logo](https://www.moosefactory.eu/resources/MooseFactoryRoundLogo.png)

**Utility Framework for iOS and MacOS**


This is a compilation of some of commonly used codes over the years.  
Feel free to contact me by email at <tristan@moosefactory.eu>

Cheers :)

Tristan Leblanc - MooseFactory Software  
<https://www.moosefactory.eu>

***

## USAGE

To use MFCocoaExtras in your project, add #import <MFCocoaExtras/MFCocoaExtras.h> in the precompiled headers (.pch file) or in the file where you need the class or method.

## DISCLAIMER

Not everything is documented and tested yet.  
Work is in progress. This disclaimer should disapear quite soon ;)

***

## Table of Content

***

##MFCocoaExtras**

###CocoaTouch+Extras

* UIBarButtonItem+Extras
    * barButtonItemWithImage

* UIButton+Extras
    * title
    * image
    * setTitle
    * setImage:
    * setTitleColorForAllStates:
    * setTitleForAllStates:
    * setImageForAllStates
* UIView+Extras
    * imageCropped:
    * imageRotated:
    * imageRotatedByDegrees:
    * imageFromView:
    * drawCenteredOnPoint
    * tintedImageWithColor
    * tintedImageWithColor
* UIView+Extras
    * removeAllSubviews:
    * moveByY:
    * moveByX:
    * moveByX:Y:
    * moveByPoint
    * addInViewAndResize
    * snapshot
    * saveSnapshotToRoll
* NSString+MFExtras
    * UUIDString
    * md5
    * sha1
    * isValidEmail:
    * isValidName
    * urlEncode
    * urlDecode

###Graphics

* CGExtras
    *MFNSUITypes
    *NSUIColor-Extras
    *MFCombinedColor


###Security

*MFSecurity
    *copy_mac_address
    *AppleRootCA
    *check_code_signature

##Author

Tristan Leblanc <tristan@moosefactory.eu>

Twitter     :	<https://www.twitter.com/tristanleblanc>  
Google+     :	<https://plus.google.com/+TristanLeblanc>  

***

##License

MFCocoaExtras is available under the MIT license. See the LICENSE file for more info.

***

*Preliminary document - Updated 03/14/2016*