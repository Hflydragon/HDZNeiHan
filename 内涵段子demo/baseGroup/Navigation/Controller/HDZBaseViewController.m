//
//  HDZBaseViewController.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/21.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "HDZBaseViewController.h"
#import "HDZLoadingView.h"

@interface HDZBaseViewController ()
@property (nonatomic,weak)HDZLoadingView *loading;
@end

@implementation HDZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [UIView setAnimationsEnabled:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
}

- (void)push:(UIViewController *)viewController{
    if(![self isKindOfViewController:viewController]) return;
    
    if(self.hidesBottomBarWhenPushed==NO){
        
        self.hidesBottomBarWhenPushed  = YES;
        
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)pop:(UIViewController *)viewController
{
    if(![self isKindOfViewController:viewController]) return;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToViewC:(UIViewController *)viewController
{
    if(![self isKindOfViewController:viewController]) return;
    [self.navigationController popToViewController:viewController animated:YES];
}

- (void)pushToRootViewC:(UIViewController *)viewController
{
    if(![self isKindOfViewController:viewController]) return;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)presentTo:(UIViewController *)viewController
{
    if(![self isKindOfViewController:viewController]) return;
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)presentTo:(UIViewController *)viewController WithCompletion:(void(^)())completion
{
    if(![self isKindOfViewController:viewController]) return;
    [self presentViewController:viewController animated:YES completion:completion];
}


- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissWithCompletion:(void(^)())completion
{
    [self dismissViewControllerAnimated:YES completion:completion];
}

- (void)removeViewControllers:(UIViewController *)viewController
{
    if(![self isKindOfViewController:viewController]) return;
    [viewController.view removeFromSuperview];
    [viewController  willMoveToParentViewController:nil];
    [viewController removeFromParentViewController];
}

- (void)addViewControllers:(UIViewController *)viewController
{
    if(![self isKindOfViewController:viewController]) return;
    [self.view addSubview:viewController.view];
    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];
    viewController.view.frame = self.view.bounds;
}

-(BOOL)isKindOfViewController:(id)object
{
    return [object isKindOfClass:[UIViewController class]];
}

- (void)startLoadingAnimation{
    
//    HDZLoadingView *loading = [HDZLoadingView shareLoadingView];
//    [loading showInView:nil];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    [[HDZLoadingView shareLoadingView] stopLoading];
}

@end
