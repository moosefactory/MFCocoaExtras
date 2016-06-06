//
//  MFUIColorWell.h
//  MoneyDonkey
//
//  Created by Tristan Leblanc on 10/02/15.
//  Copyright (c) 2015 MooseFactory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MFCocoaExtras/MFCocoaExtras.h>

@protocol MFColorWellDelegate <NSObject>

-(void)colorWellPressed:(id)sender;

@end

@interface MFColorWell : NSUIControl

@property(nonatomic,strong) UIColor* color;
@property(nonatomic,strong) IBOutlet id<MFColorWellDelegate> delegate;

@end
