/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - v1.0.0                 */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2016 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/
/*
 **Copyright (c) 2016 Tristan Leblanc - MooseFactory Software <tristan@moosefactory.eu>**
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "UIButton+Extras.h"


@implementation UIButton ( UIButton_Extras ) 

#pragma mark ----- Normal State Title Accessors  -----

-(NSString*)title
{
    return [self titleForState:self.state];
}

-(UIImage*)image
{
    return [self imageForState:self.state];
}

-(void)setTitle:(NSString*)title
{
    return [self setTitle:title forState:self.state];
}

-(void)setImage:(UIImage*)image
{
    [self setImage:image forState:self.state];
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
