//
//  UIBarButtonItem+Extras.m
//  Diceepline
//
//  Created by Tristan Leblanc on 16/01/15.
//  Copyright (c) 2015 MooseFactory. All rights reserved.
//

#import "UIBarButtonItem+Extras.h"

@implementation UIBarButtonItem(Extras)

+(UIBarButtonItem*)barButtonItemWithImage:(NSString*)imageName tag:(NSInteger)tag target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:imageName]  ;
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 38, 38);
    button.tag = tag;
    
    return [[UIBarButtonItem alloc] initWithCustomView:button] ;
}

@end
