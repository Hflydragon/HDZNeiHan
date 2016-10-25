//
//  HDZHomeViewController.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/21.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "HDZHomeViewController.h"
#import "HDZCustomSegmentView.h"
#import "HDZCustomMenusScroll.h"
#import "HDZCustomSliderVC.h"


@interface HDZHomeViewController ()<HDZCustomSliderVCDelegate>

@property (nonatomic,strong)HDZCustomSliderVC *customSliderVC;

@property (nonatomic,weak)HDZCustomMenusScroll *menu;

@property (nonatomic,strong)NSArray *titleArray;

@end

@implementation HDZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super startLoadingAnimation];
    
    [self setUPSegmentView];
}

-(void)setUPSegmentView
{
    //设置上面的精选及关注按钮
    HDZCustomSegmentView *segmentView = [[HDZCustomSegmentView alloc] initWithTitles:@[@"精选",@"关注"]];
    segmentView.frame = CGRectMake(0, 0, 130, 35);
    self.navigationItem.titleView = segmentView;
    [segmentView clickDefault];
    segmentView.btnSelectedHandler = ^(HDZCustomSegmentView *segmentView,NSString *title,NSInteger index){
        
    };
    
    
    self.titleArray = @[@"推荐",@"视频",@"段子",@"笑话",@"图片",@"音乐",@"上网",@"游戏",@"直播"];
    //设置滑动的条目菜单
    HDZCustomMenusScroll *menu = [[HDZCustomMenusScroll alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, 40)];
    [menu setUpTitleArrays:self.titleArray];
    [self.view addSubview:menu];
    self.menu = menu;
    menu.menuScrollerDidSelectItem = ^(HDZCustomMenusScroll *menu,NSString *title,NSUInteger index){
        self.customSliderVC.selectIndex = index;
    };
    [menu clickDefault];
    [self.customSliderVC reloadData];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self startLoadingAnimation];
//}

-(HDZCustomSliderVC *)customSliderVC
{
    if (_customSliderVC==nil) {
        _customSliderVC = [[HDZCustomSliderVC alloc] init];
        [_customSliderVC setUpTitleArray:self.titleArray];
        [_customSliderVC willMoveToParentViewController:self];
        _customSliderVC.view.frame = CGRectMake(0, 40, KscreenWidth, KscreenHeight - 40);
        _customSliderVC.delegate = self;
        [self addChildViewController:_customSliderVC];
        [self.view addSubview:_customSliderVC.view];
    }
    return _customSliderVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//HDZCustomSliderVC的代理
-(NSInteger)numberOfChildVCInCustomSliderVC
{
    return self.titleArray.count;
}
- (void)customSliderDidScroll:(UIScrollView *)scroll andSegmentPage:(NSInteger)page
{
    self.menu.selectedindex  = page;
}

@end
