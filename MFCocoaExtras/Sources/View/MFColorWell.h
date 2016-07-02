//
//  MFUIColorWell.h
//  MoneyDonkey
//
//  Created by Tristan Leblanc on 10/02/15.
//  Copyright (c) 2015 MooseFactory. All rights reserved.
//

#import <MFCocoaExtras/MFNSUIView.h>

@protocol MFColorWellDelegate <NSObject>

-(void)colorWellPressed:(id)sender;

@end

@interface MFColorWell : MFNSUIView

@property(nonatomic,strong) NSUIColor* color;
@property(nonatomic,strong) IBOutlet id<MFColorWellDelegate> delegate;

@end
