//
//  HDZCustomSegmentView.h
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//  首页的标题选择

#import <UIKit/UIKit.h>

@interface HDZCustomSegmentView : UIView

@property (nonatomic,copy) void(^btnSelectedHandler)(HDZCustomSegmentView *segmentView,NSString *title,NSInteger index);

-(void)clickDefault;

- (instancetype)initWithTitles:(NSArray *)titles;

@end
