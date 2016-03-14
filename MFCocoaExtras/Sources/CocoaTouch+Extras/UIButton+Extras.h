//
//  UIControl-Extras.h
//  EyePhone
//
//  Created by Tristan Leblanc on 28/12/10.
//  Copyright 2010 MooseFactory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton ( UIButton_Extras ) 

-(NSString*)title;
-(void)setTitle:(NSString*)inTitle;

-(void)setTitleColorForAllStates:(UIColor*)color;
-(void)setTitleForAllStates:(NSString*)title;
-(void)setImageForAllStates:(UIImage*)image;

@end
