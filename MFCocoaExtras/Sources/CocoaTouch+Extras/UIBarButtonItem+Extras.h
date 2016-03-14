//
//  UIBarButtonItem+Extras.h
//  Diceepline
//
//  Created by Tristan Leblanc on 16/01/15.
//  Copyright (c) 2015 MooseFactory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem(Extras)

+(UIBarButtonItem*)barButtonItemWithImage:(NSString*)imageName tag:(NSInteger)tag target:(id)target selector:(SEL)selector;

@end
