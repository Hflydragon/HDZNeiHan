//
//  HDZTabBarController.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/21.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "HDZTabBarController.h"
#import "HDZNavigationController.h"

#import "HDZHomeViewController.h"
#import "HDZSearchViewController.h"
#import "HDZNewsViewController.h"
#import "HDZMessageViewController.h"

static UIColor *color;

@interface HDZTabBarController ()

@end

@implementation HDZTabBarController
+(void)initialize
{
    color = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    // Do any additional setup after loading the view.
    //设置不透明
    [UITabBar appearance].barTintColor = color;
    //设置工具栏的整个外观
    [[UITabBar appearance] setTranslucent:NO];
    
    //设置整个tabBar的风格
    UITabBarItem *item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, 1.5);
    
    //设置普通状态时的tab
    NSMutableDictionary *normal = [NSMutableDictionary dictionary];
    [normal setObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];
    [normal setObject:[UIColor colorWithRed:0.62f green:0.62f blue:0.63f alpha:1.00f] forKey:NSForegroundColorAttributeName];
    [item setTitleTextAttributes:normal forState:UIControlStateNormal];
    
    //设置选中状态时的tab
    NSMutableDictionary *selected = [NSMutableDictionary dictionary];
    [selected setObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];
    [selected setObject:[UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f] forKey:NSForegroundColorAttributeName];
    [item setTitleTextAttributes:selected forState:UIControlStateSelected];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}
//添加子控制器
- (void)addChildViewControllers
{
    [self addViewControllerName:[HDZHomeViewController description] andTitle:@"刷新" andImageIcon:@"home"];
    [self addViewControllerName:[HDZSearchViewController description] andTitle:@"发现" andImageIcon:@"Found"];
    [self addViewControllerName:[HDZNewsViewController description] andTitle:@"新鲜" andImageIcon:@"newstab"];
    [self addViewControllerName:[HDZMessageViewController description] andTitle:@"消息" andImageIcon:@"audit"];

}

- (void)addViewControllerName:(NSString *)viewController andTitle:(NSString *)title andImageIcon:(NSString *)iconImage
{
    
    UIViewController *controller = [[NSClassFromString(viewController) alloc] init];
    HDZNavigationController *nav = [[HDZNavigationController alloc] initWithRootViewController:controller];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_press",iconImage]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.image = [UIImage imageNamed:iconImage];
    [self addChildViewController:nav];
}


@end
