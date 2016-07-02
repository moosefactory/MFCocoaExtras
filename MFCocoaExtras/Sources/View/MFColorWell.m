//
//  MFNSUIColorWell.m
//  MoneyDonkey
//
//  Created by Tristan Leblanc on 10/02/15.
//  Copyright (c) 2015 MooseFactory. All rights reserved.
//

#import <MFCocoaExtras/MFColorWell.h>
#import <MFCocoaExtras/MFCGCombinedColor.h>

@implementation MFColorWell

-(void)setColor:(NSUIColor *)color
{
    _color = color;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    CGRect bnd = self.bounds;
    
    CGContextRef ctx = NSUIGetCurrentContext;
    if (!_color) {
        [self drawColor:[[NSUIColor blackColor] colorWithAlphaComponent:0.0f]];
    } else {
        [self drawColor:_color];
        //CGContextFillRect(ctx, bnd);
    }
    [[NSUIColor blackColor] setStroke];
    CGContextStrokeRect(ctx, bnd);
}


-(void)drawColor:(NSUIColor*)inColor
{
    CGRect frame = self.bounds;
    CGContextRef ctx = NSUIGetCurrentContext;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, frame.origin.x,frame.origin.y);
    CGPathAddLineToPoint(path, NULL,frame.origin.x,frame.size.height);
    CGPathAddLineToPoint(path, NULL,frame.size.width,frame.origin.y);
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    CGContextSetFillColorWithColor(ctx,CGColorCreate(CGColorSpaceCreateDeviceRGB(), MFCG_BlackColor));
    CGContextFillPath(ctx);
    CGContextSetFillColorWithColor(ctx,self.color.CGColor);
    CGContextFillRect(ctx,frame);
    CGContextSetStrokeColor(ctx, MFCG_BlackColor);
    CGContextStrokeRect(ctx, self.bounds);
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
