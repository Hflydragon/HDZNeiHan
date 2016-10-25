//
//  UIView+CALayer.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "UIView+CALayer.h"

@implementation UIView (CALayer)

-(void)setLayerCornerRadius:(CGFloat)layerCornerRadius
{
    self.layer.cornerRadius = layerCornerRadius;
    [self _coglit];
}

-(CGFloat)layerCornerRadius
{
    return self.layer.cornerRadius;
}

-(void)setLayerBorderColor:(UIColor *)layerBorderColor
{
    self.layer.borderColor = layerBorderColor.CGColor;
    [self _coglit];
}
-(UIColor *)layerBorderColor
{
    return  [UIColor colorWithCGColor:self.layer.borderColor];;
}

-(void)setLayerBorderWidth:(CGFloat)layerBorderWidth
{
    self.layer.borderWidth = layerBorderWidth;
    [self _coglit];
}

-(CGFloat)layerBorderWidth
{
    return self.layer.borderWidth;
}

-(void)_coglit
{
    self.layer.masksToBounds = YES;
    
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    self.layer.shouldRasterize = YES;
}

@end
