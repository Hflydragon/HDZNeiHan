//
//  HDZLoadingView.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/21.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "HDZLoadingView.h"
#import <YYKit.h>

@interface HDZLoadingView ()

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation HDZLoadingView

- (instancetype) init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];;
    }
    return self;
}

+(instancetype)shareLoadingView
{
    static HDZLoadingView *loading;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
         loading = [[HDZLoadingView alloc] init];
    });
    return loading;
}

- (void)showInView:(UIView *)view
{
    if (view==nil){
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    [view addSubview:self];
    self.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-113);
    self.imageView.frame = CGRectMake(0, 0, 70, 100);
    self.imageView.center = self.center;
}

-(UIImageView *)imageView
{
    if (_imageView==nil) {
        UIImageView *img = [[YYAnimatedImageView alloc] initWithImage:[YYImage imageNamed:@"wall-e"]];
        [self addSubview:img];
        _imageView = img;
    }
    return _imageView;
}

- (void)stopLoading
{
    [self removeFromSuperview];
    [[YYWebImageManager sharedManager].cache.memoryCache removeAllObjects];
    [[YYWebImageManager sharedManager].cache.diskCache removeAllObjects];
}

@end
