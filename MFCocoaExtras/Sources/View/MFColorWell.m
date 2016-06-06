//
//  MFNSUIColorWell.m
//  MoneyDonkey
//
//  Created by Tristan Leblanc on 10/02/15.
//  Copyright (c) 2015 MooseFactory. All rights reserved.
//

#import "MFColorWell.h"

@implementation MFColorWell

@synthesize color;

-(void)setColor:(NSUIColor *)color
{
    self->color = color;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    CGRect bnd = self.bounds;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (!color) {
        [self drawColor:[[NSUIColor blackColor] colorWithAlphaComponent:0.0f]];
    } else {
        [self drawColor:color];
        CGContextFillRect(ctx, bnd);
    }
    [[NSUIColor blackColor] setStroke];
    CGContextStrokeRect(ctx, bnd);
}

-(void)drawColor:(NSUIColor*)inColor
{
    CGRect frame = self.bounds;
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:frame.origin];
    [path addLineToPoint:CGPointMake(frame.origin.x,frame.size.height)];
    [path addLineToPoint:CGPointMake(frame.size.width,frame.origin.y)];
    [path closePath];

    UIBezierPath* alphaPath = [UIBezierPath bezierPath];
    [alphaPath moveToPoint:CGPointMake(frame.size.width,frame.size.height)];
    [alphaPath addLineToPoint:CGPointMake(frame.origin.x,frame.size.height)];
    [alphaPath addLineToPoint:CGPointMake(frame.size.width,frame.origin.y)];
    [alphaPath closePath];

    NSUIColor* fullColor = [inColor colorWithNoAlpha];
    
    [fullColor setFill];
    [path fill];
    [inColor setFill];
    [alphaPath fill];
}

#if TARGET_OS_IPHONE
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(colorWellPressed:)]) {
            [self.delegate colorWellPressed:self];
        }
    }
}
#endif
@end
