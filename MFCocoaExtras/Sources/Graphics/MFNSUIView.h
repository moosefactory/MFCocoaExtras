//
//  MFNSUIView.h
//  MFCocoaExtras
//
//  Created by Tristan Leblanc on 06/06/16.
//  Copyright © 2016 MooseFactory. All rights reserved.
//

#import <MFCocoaExtras/MFNSUITypes.h>

@interface MFNSUIView : NSUIView

#if TARGET_OS_IPHONE

-(void)setWantsLayer:(BOOL)wantsLayer;

#else

-(void)setNeedsDisplay;

@property(nonatomic,strong) NSColor* backgroundColor;
#endif

@end

