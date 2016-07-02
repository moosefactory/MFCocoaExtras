//
//  RoundCornersView.m
//  iGeoCam
//
//  Created by Tristan Leblanc on 07/03/10.
//  Copyright 2010 MooseFactory. All rights reserved.
//

#import "MFRoundCornersView.h"
#import <MFFoundation/MFMathUtilities.h>

@implementation MFRoundCornersView

- (void)dealloc {
	_borderColor=NULL;
#if (!__has_feature(objc_arc))
    [super dealloc];
#endif
}

-(id)initWithFrame:(NSUIRect)frameRect
{
    if ( self = [super initWithFrame:frameRect] ) {
        [self initDefaultDrawingAttributes];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
#if TARGET_OS_MAC
    self.wantsLayer = YES;
#endif
    [self initDefaultDrawingAttributes];
}

-(void)initDefaultDrawingAttributes
{
	self.cornerRadius = 10.0;
	self.borderWidth = 2.0;
	self.borderColor = [NSUIColor blackColor];
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    if (cornerRadius<0.0f) _cornerRadius = 0.0f;
    else {
        CGFloat maxRadius = MF_min(self.bounds.size.width,self.bounds.size.height) / 2.0f;
        if (cornerRadius>maxRadius) _cornerRadius = maxRadius;
        else {
            _cornerRadius = cornerRadius;
        }
    }
    self.layer.cornerRadius = _cornerRadius;
    [self setNeedsDisplay];
}

-(void)setBorderColor:(NSUIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
    [self setNeedsDisplay];
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    if (borderWidth<0.0f) _borderWidth = 0.0f;
    else _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
    [self setNeedsDisplay];
}
/*
- (void)drawRect:(CGRect)rect {
    BOOL hasBorder = ( _borderColor.alpha > 0.0f ) && (_borderWidth > 0.0f );
    BOOL hasFill = ( _borderColor.alpha > 0.0f );
	if ( hasFill || hasBorder ) {

    CGContextRef	context = UIGraphicsGetCurrentContext();
	
	CGRect	r=self.bounds;
    float o=_borderWidth/2.0f;
	r.size.width-=_borderWidth;
	r.size.height-=_borderWidth;
	r.origin.x+=o;
	r.origin.y+=o;
	CGSize s = r.size;
	
	CGMutablePathRef	path = CGPathCreateMutable();
    if (_cornerRadius>0.0f) {
        CGPathMoveToPoint(path,NULL,o+_cornerRadius,o);
        CGPathAddLineToPoint(path,NULL,o+s.width-_cornerRadius,o);
        CGPathAddArc(path,NULL, o+s.width-_cornerRadius, o+_cornerRadius , _cornerRadius,-M_PI/2.0f,0, false);
        CGPathAddLineToPoint(path,NULL,o+s.width, o+s.height - _cornerRadius);
        CGPathAddArc(path,NULL, o+s.width-_cornerRadius, o+s.height - _cornerRadius , _cornerRadius,0,M_PI/2.0f, false);
        CGPathAddLineToPoint(path,NULL,o+_cornerRadius,o+s.height);
        CGPathAddArc(path,NULL, o+_cornerRadius, o+s.height - _cornerRadius , _cornerRadius,M_PI/2.0f,M_PI, false);
        CGPathAddLineToPoint(path,NULL,o,o+_cornerRadius);
        CGPathAddArc(path,NULL, o+_cornerRadius, o + _cornerRadius , _cornerRadius,M_PI,M_PI+M_PI/2.0f, false);
    }
    else {
        CGPathAddRect(path, NULL, r);
    }
    if ( hasFill ) {
        [self.backgroundColor setFill];
        CGContextAddPath(context, path);
        CGContextFillPath(context);
    }
    if ( hasBorder ) {
        [_borderColor setStroke];
        CGContextSetLineWidth(context,_borderWidth);
        CGContextAddPath(context, path);
        CGContextStrokePath(context);
    }
    
    CGPathRelease(path);
    }
}
*/
@end
