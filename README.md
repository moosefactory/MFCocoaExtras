![MooseFactoryLogo](Documentation/MFFoundation_Header.png)

**Utility Framework for iOS and MacOS**


This is a compilation of some of commonly used codes over the years.  
Feel free to contact me by email at <tristan@moosefactory.eu>

Cheers :)

Tristan Leblanc - MooseFactory Software  
<https://www.moosefactory.eu>

----

#<font color='#808080'>Content</font>

----

## <font color='#C3642C'>CocoaTouch+Extras</font>

----

### UIBarButtonItem+Extras

** One line bar button item creation **

- barButtonItemWithImage

----

### UIButton+Extras

** MacOS / iOS Button utilities **

- title
- image
- setTitle
- setImage:
- setTitleColorForAllStates:
- setTitleForAllStates:
- setImageForAllStates

----

### UIImage+Extras

- imageCropped:
- imageRotated:
- imageRotatedByDegrees:
- imageFromView:
- drawCenteredOnPoint
- tintedImageWithColor
- tintedImageWithColor: blendMode:

### UIView+Extras

- removeAllSubviews:
- moveByY:
- moveByX:
- moveByX:Y:
- moveByPoint
- addInViewAndResize
- snapshot
- saveSnapshotToRoll

----

## <font color='#C3642C'>Graphics</font>

----

### MFCGExtras

** CoreGraphics and Cocoa Geometry Utilities **

**CoreGraphics**

- Size Calculations
	- GSizeWithRatio
	- CGSizeWithRatios<br><br>
- Rect Calculations
	- CGRectHeaderWithRatio
	- CGRectBottomWithRatio
	- CGRectWithRatio
	- CGRectWithRatios
	- CGRectMiddle
	- CGRectCenterOnCGRect

**MacOS**

- NSSizeWithRatio
- NSRectMiddle
- NSRectCenterOnNSRect


----

### MFNSUITypes

** Cool defines to create MacOS / iOS source files **

- Foundation Types
	- NSUIRect<br><br>
- CocoaTypes
	- NSUIColor         
	- NSUIColorSpace    
	- NSUIImage         
	- NSUIFont          
	- NSUIControl       
	- NSUILabel         
	- NSUIView          
	- NSUIViewController

----

### NSUIColor-Extras

**A collection of MacOS / iOS color utilities**

- Color as Values
	- hexValueString
	- webColorString
	- longNumber
	- longValue<br><br>
- Color Creation
	- colorWithHexString
	- colorWithLongValue
	- colorWithLongNumber
	- colorWithCGColor<br><br>
- Comparisons
	- compareByLightness
	- compareByHue
	- compareBySaturation<br><br>
- Color by changing alpha
	- colorWithNoAlpha
	- colorWithAlphaComponentMultipliedBy<br><br>
- Accessors
	- red
	- green
	- blue
	- alpha

----

### MFCGCombinedColor

**A standard C color class for fast hsl / rgb computations**

- MFCGCombinedColorSetRGBA
- MFCGCombinedColorSetHSL
- MFCGRGBToHSL
- MFCGHSLToRGB

----

## <font color='#C3642C'>Views</font>

----

### MFColorWell

### MFRoundCornersView

----

## <font color='#C3642C'>Security</font>

----

### MFSecurity

- copy_mac_address
- AppleRootCA
- check_code_signature

----

#<font color='#808080'>Installation</font>

MFCocoaExtras is available through CocoaPods. To install it, simply add the following line to your Podfile:

	pod 'MFCocoaExtras'


----


#<font color='#808080'>Author</font>

Tristan Leblanc <tristan@moosefactory.eu>

Twitter     :	<https://www.twitter.com/tristanleblanc>  
Google+     :	<https://plus.google.com/+TristanLeblanc>  

Link for recruiters ( Online Resume ) : <http://tristan.moosefactory.eu>

----

#<font color='#808080'>Contribute</font>

If you wish to contribute, check the CONTRIBUTE<CONTRIBUTE.md> file for more information.

***

#<font color='#808080'>License</font>

MFCocoa is available under the MIT license. See the LICENSE file for more info.

***

*Preliminary document - Updated 03/14/2016*