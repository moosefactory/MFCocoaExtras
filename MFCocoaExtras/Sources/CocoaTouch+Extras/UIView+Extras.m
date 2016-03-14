//
//  UIView+Extras.m
//  MoofLibrary
//
//  Created by Moose on 7/5/14.
//  Copyright (c) 2014 MooseFactory Software. All rights reserved.
//

#import "UIView+Extras.h"

@implementation UIView (Extras)

-(void)removeAllSubviews
{
    NSArray* subviews = self.subviews;
    for (UIView* aSubview in subviews) {
        [aSubview removeFromSuperview];
    }
}

-(void)centerInView:(UIView*)view
{
    CGRect frame = self.frame;
    CGRect dstFrame = view.bounds;
    
    CGPoint offset = CGPointMake( (dstFrame.size.width - frame.size.width) / 2.0f, (dstFrame.size.height - frame.size.height) / 2.0f);
    frame.origin.x=dstFrame.origin.x+offset.x;
    frame.origin.y=dstFrame.origin.y+offset.y;
    self.frame = frame;
}

-(void)moveByY:(CGFloat)dY
{
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y + dY;
    self.frame = frame;
}

-(void)moveByX:(CGFloat)dX
{
    CGRect frame = self.frame;
    frame.origin.x = frame.origin.x + dX;
    self.frame = frame;
}

-(void)moveByX:(CGFloat)dX y:(CGFloat)dY
{
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y + dY;
    frame.origin.x = frame.origin.x + dX;
    self.frame = frame;
}

-(void)moveByPoint:(CGPoint)delta
{
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y + delta.y;
    frame.origin.x = frame.origin.x + delta.x;
    self.frame = frame;
}

-(void)addInViewAndResize:(UIView*)view
{
    CGRect frame = view.frame;
    [view addSubview:self];
    frame.origin = CGPointZero;
    self.bounds = frame;
    self.frame = frame;
}

-(UIImage*)snapshot
{
    return [UIImage imageFromView:self];
}

-(void)saveSnapshotToRoll
{
    UIImage *snapshot = [UIImage imageFromView:self];
    if (snapshot) {
        UIImageWriteToSavedPhotosAlbum(snapshot, nil, nil, nil);
    }
}

@end
