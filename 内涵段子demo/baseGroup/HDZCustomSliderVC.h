//
//  HDZCustomSliderVC.h
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//  滑动内容控制器

#import "HDZBaseViewController.h"

@protocol HDZCustomSliderVCDelegate <NSObject>

- (NSInteger)numberOfChildVCInCustomSliderVC;

- (void)customSliderDidScroll:(UIScrollView *)scroll andSegmentPage:(NSInteger)page;

@end

@interface HDZCustomSliderVC : HDZBaseViewController

@property (nonatomic,weak)id <HDZCustomSliderVCDelegate> delegate;

@property (nonatomic,assign)NSInteger selectIndex;

-(void)setUpTitleArray:(NSArray *)array;

- (void)reloadData;
@end
