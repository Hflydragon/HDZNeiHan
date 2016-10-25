//
//  HDZLoadingView.h
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/21.
//  Copyright © 2016年 feilong. All rights reserved.
//  加载动画的那个显示器

#import <UIKit/UIKit.h>

@interface HDZLoadingView : UIView

+(instancetype)shareLoadingView;

- (void)showInView:(UIView *)view;

- (void)stopLoading;

@end
