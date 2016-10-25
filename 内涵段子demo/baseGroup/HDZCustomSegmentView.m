//
//  HDZCustomSegmentView.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "HDZCustomSegmentView.h"
#import "UIView+CALayer.h"

@implementation HDZCustomSegmentView
{
    NSArray *_titleArray;
    UIButton *_selectedBtn;
}
- (instancetype)initWithTitles:(NSArray *)titles
{
    if (self = [super init]) {
        _titleArray = titles;
        self.layerCornerRadius = 5;
        self.layerBorderColor = [UIColor colorWithRed:0.62 green:0.47 blue:0.26 alpha:1.0];
        self.layerBorderWidth = 1.0;
        
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews
{
    //设置子控制器
    if(_titleArray.count>0)
    {
        NSInteger i = 0;
        for (id obj in _titleArray) {
            if ([obj isKindOfClass:[NSString class]]) {
                NSString *objStr = (NSString *)obj;

                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setTitle:objStr forState:UIControlStateNormal];
                btn.titleLabel.font = [UIFont systemFontOfSize:16];
                [self addSubview:btn];
                btn.backgroundColor = [UIColor colorWithRed:0.86f green:0.85f blue:0.80f alpha:1.00f];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                [btn setTitleColor:[UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f] forState:UIControlStateNormal];
                i = i + 1;
                btn.tag = i;
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.adjustsImageWhenDisabled = NO;
                btn.adjustsImageWhenHighlighted = NO;
            }
        }
    }
    
}

-(void)clickDefault
{
    if (_selectedBtn.tag==1) {
        return;
    }
    [self btnClick:[self viewWithTag:1]];
}

-(void)btnClick:(UIButton *)sender
{
    _selectedBtn.backgroundColor = [UIColor colorWithRed:0.86f green:0.85f blue:0.80f alpha:1.00f];
    _selectedBtn.selected = NO;
    sender.backgroundColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    sender.selected = YES;
    _selectedBtn = sender;
    
    if (self.btnSelectedHandler) {
        self.btnSelectedHandler(self,sender.currentTitle,sender.tag);
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnW = self.frame.size.width / _titleArray.count;
    for(int i = 0;i<_titleArray.count;i++){
        UIButton *btn = (UIButton *)[self viewWithTag:i+1];
        btn.frame = CGRectMake(i*btnW, 0, btnW, 35);
    }
}

@end
