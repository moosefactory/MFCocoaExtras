//
//  RoundCornersView.h
//  iGeoCam
//
//  Created by Tristan Leblanc on 07/03/10.
//  Copyright 2010 MooseFactory. All rights reserved.
//

#import <MFCocoaExtras/MFNSUIView.h>

@interface MFRoundCornersView : MFNSUIView

@property (nonatomic,assign) CGFloat    cornerRadius;
@property (nonatomic,assign) CGFloat    borderWidth;
@property (nonatomic,strong) NSUIColor*	borderColor;
//@property (nonatomic,strong) NSUIColor*	fillColor;

@end
