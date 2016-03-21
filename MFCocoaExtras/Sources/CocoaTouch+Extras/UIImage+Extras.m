/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - v1.0.0                 */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2016 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/
/*
 **Copyright (c) 2016 Tristan Leblanc - MooseFactory Software <tristan@moosefactory.eu>**
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "UIImage+Extras.h"
#import "CGExtras.h"

@implementation UIImage (Extras)

static CGFloat degreesToRadians(CGFloat degrees) { return degrees * M_PI / 180.0f; }

- (UIImage *)imageCropped:(CGRect)cropRect
{
    // Create the bitmap context
    UIGraphicsBeginImageContext(cropRect.size);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextTranslateCTM(bitmap, 0.0f, -self.size.height);
    CGRect destRect = CGRectMake( -cropRect.origin.x,cropRect.origin.y,self.size.width,self.size.height );
    CGContextDrawImage(bitmap, destRect, [self CGImage]);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageRotated:(CGFloat)radians scale:(CGFloat)scale
{
    CGFloat w = self.size.width*scale;
    CGFloat h = self.size.height*scale;
    
    /*
     
     NEED SOME TESTS HERE
     
     switch (self.imageOrientation) {
        case UIImageOrientationRight:
     */
            h = self.size.width*scale;
            w = self.size.height*scale;
    /*
            break;
    }
     */
    
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,w,h)];
    CGAffineTransform t = CGAffineTransformMakeRotation(radians);
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
#if (!__has_feature(objc_arc))
    [rotatedViewBox release];
#endif
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, radians);
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-w / 2, -h / 2, w, h), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)imageRotated:(CGFloat)radians
{
    return [self imageRotated:radians scale:1.0];
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{   
	return [self imageRotated:degreesToRadians( degrees )];
}

+ (UIImage *)imageFromView:(UIView*)view
{
    //hide controls if needed
    CGRect rect = [view bounds];
    
    UIGraphicsBeginImageContext(rect.size);
#if _IMAGEFROMVIEW_USE_RENDER_LAYER_
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);// view.backgroundColor.CGColor);
    CGContextFillRect(context, rect);
    [view.layer renderInContext:context];*/
    [view drawViewHierarchyInRect:rect afterScreenUpdates:NO];
#endif
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(void)drawCenteredOnPoint:(CGPoint)point
{
    CGSize s = self.size;
    [self drawAtPoint:CGPointMake(point.x-s.width/2.0f,point.y-s.height/2.0f)];
}

-(void)drawCenteredOnPoint:(CGPoint)point sizeRatio:(CGFloat)ratio
{
    CGSize s = CGSizeWithRatio(self.size,ratio);
    [self drawInRect:CGRectMake(point.x-s.width/2.0f,point.y-s.height/2.0f,s.width,s.height)];
}

-(UIImage *)tintedImageWithColor:(UIColor *) tint // This is a simpler way to call the main method below..
{
    return [self tintedImageWithColor: tint blend:kCGBlendModeSourceAtop];
}


- (UIImage *) tintedImageWithColor:(UIColor *) tint blend:(CGBlendMode) op
// This method creates a new image, draws the original image into it, composites  the tint color over it with the given  NSCompositingOperation value, and returns the resulting image.
{
   CGSize size = [self size];
    CGRect imageBounds = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext([self size]);

    [self drawInRect:imageBounds blendMode:kCGBlendModeNormal alpha:1.0];
    [tint set];
    UIRectFillUsingBlendMode(imageBounds,op);
    //[self drawInRect:imageBounds blendMode:op alpha:1.0];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
#if (!__has_feature(objc_arc))
    return [image autorelease];  // Always balance the -retain/-release calls.
#else
    return image;
#endif
}


@end
