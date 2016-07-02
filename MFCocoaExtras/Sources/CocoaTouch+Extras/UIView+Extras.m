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

#import <MFCocoaExtras/UIView+Extras.h>

@implementation NSUIView (Extras)

-(void)removeAllSubviews
{
    NSArray* subviews = self.subviews;
    for (UIView* aSubview in subviews) {
        [aSubview removeFromSuperview];
    }
}

-(void)centerInView:(UIView*)view
{
    CGRect frame = self.frame;
    CGRect dstFrame = view.bounds;
    
    CGPoint offset = CGPointMake( (dstFrame.size.width - frame.size.width) / 2.0f, (dstFrame.size.height - frame.size.height) / 2.0f);
    frame.origin.x=dstFrame.origin.x+offset.x;
    frame.origin.y=dstFrame.origin.y+offset.y;
    self.frame = frame;
}

-(void)moveByY:(CGFloat)dY
{
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y + dY;
    self.frame = frame;
}

-(void)moveByX:(CGFloat)dX
{
    CGRect frame = self.frame;
    frame.origin.x = frame.origin.x + dX;
    self.frame = frame;
}

-(void)moveByX:(CGFloat)dX y:(CGFloat)dY
{
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y + dY;
    frame.origin.x = frame.origin.x + dX;
    self.frame = frame;
}

-(void)moveByPoint:(CGPoint)delta
{
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y + delta.y;
    frame.origin.x = frame.origin.x + delta.x;
    self.frame = frame;
}

-(void)addInViewAndResize:(UIView*)view
{
    CGRect frame = view.frame;
    [view addSubview:self];
    frame.origin = CGPointZero;
    self.bounds = frame;
    self.frame = frame;
}


-(UIImage*)snapshot
{
    return [UIImage imageFromView:self];
}

-(void)saveSnapshotToRoll
{
    UIImage *snapshot = [UIImage imageFromView:self];
    if (snapshot) {
        UIImageWriteToSavedPhotosAlbum(snapshot, nil, nil, nil);
    }
}

@end
