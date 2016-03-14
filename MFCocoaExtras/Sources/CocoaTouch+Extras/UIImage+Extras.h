//
//  UIImage+Extras.h
//  MoofLibrary
//
//  Created by Master on 18/02/12.
//  Copyright (c) 2012 MooseFactory Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Extras)

- (UIImage *)imageCropped:(CGRect)cropRect;

- (UIImage *)imageRotated:(CGFloat)radians scale:(CGFloat)scale;
- (UIImage *)imageRotated:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
+ (UIImage *)imageFromView:(UIView*)view;

-(void)drawCenteredOnPoint:(CGPoint)point;
-(void)drawCenteredOnPoint:(CGPoint)point sizeRatio:(CGFloat)ratio;

-(UIImage *)tintedImageWithColor:(UIColor *)tint;
-(UIImage *)tintedImageWithColor:(UIColor *)tint blend:(CGBlendMode)op;

@end
