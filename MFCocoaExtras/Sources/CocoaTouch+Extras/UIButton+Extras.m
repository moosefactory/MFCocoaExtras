//
//  UIControl-Extras.m
//  EyePhone
//
//  Created by Tristan Leblanc on 28/12/10.
//  Copyright 2010 MooseFactory. All rights reserved.
//

#import "UIButton+Extras.h"


@implementation UIButton ( UIButton_Extras ) 

#pragma mark ----- Normal State Title Accessors  -----

-(NSString*)title
{
	return [self titleForState:UIControlStateNormal];
}

-(void)setTitle:(NSString*)title
{
	return [self setTitle:title forState:UIControlStateNormal];
}

-(void)setTitleColorForAllStates:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateNormal ] ;
    [self setTitleColor:color forState:UIControlStateSelected ] ;
    [self setTitleColor:color forState:UIControlStateHighlighted ] ;
    [self setTitleColor:color forState:UIControlStateDisabled ] ;
}

-(void)setTitleForAllStates:(NSString*)title
{
    [self setTitle:title forState:UIControlStateNormal ] ;
    [self setTitle:title forState:UIControlStateSelected ] ;
    [self setTitle:title forState:UIControlStateHighlighted ] ;
    [self setTitle:title forState:UIControlStateDisabled ] ;
}

-(void)setImageForAllStates:(UIImage*)image
{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:image forState:UIControlStateSelected];
    [self setImage:image forState:UIControlStateHighlighted];
    [self setImage:image forState:UIControlStateDisabled];
}

@end
