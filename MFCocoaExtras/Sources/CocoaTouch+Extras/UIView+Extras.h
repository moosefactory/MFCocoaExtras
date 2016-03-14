//
//  UIView+Extras.h
//  MoofLibrary
//
//  Created by Moose on 7/5/14.
//  Copyright (c) 2014 MooseFactory Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Extras.h"

@interface UIView (Extras)

-(void)removeAllSubviews;
-(void)centerInView:(UIView*)view;

-(void)moveByY:(CGFloat)dY;
-(void)moveByX:(CGFloat)dX;
-(void)moveByX:(CGFloat)dX y:(CGFloat)dY;
-(void)moveByPoint:(CGPoint)delta;

-(void)addInViewAndResize:(UIView*)view;

-(UIImage*)snapshot;
-(void)saveSnapshotToRoll;

@end
