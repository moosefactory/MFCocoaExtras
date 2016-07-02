//
//  MFNSUIView.m
//  MFCocoaExtras
//
//  Created by Tristan Leblanc on 06/06/16.
//  Copyright © 2016 MooseFactory. All rights reserved.
//

#import "MFNSUIView.h"

@implementation MFNSUIView


#if TARGET_OS_IPHONE
-(void)setWantsLayer:(BOOL)wantsLayer
{
    
}
#else

-(void)setNeedsDisplay
{
    [self setNeedsDisplay:YES];
}

-(void)setBackgroundColor:(NSUIColor*)color
{
    self.wantsLayer = YES;
    self.layer.backgroundColor = color.CGColor;
}
#endif

@end
