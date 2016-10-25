//
//  HDZBaseViewController.h
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/21.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDZBaseViewController : UIViewController

- (void)push:(UIViewController *)viewController;

- (void)pop:(UIViewController *)viewController;

- (void)popToViewC:(UIViewController *)viewController;

- (void)pushToRootViewC:(UIViewController *)viewController;

- (void)presentTo:(UIViewController *)viewController;

- (void)presentTo:(UIViewController *)viewController WithCompletion:(void(^)())completion;

- (void)dismiss;

- (void)dismissWithCompletion:(void(^)())completion;

- (void)removeViewControllers:(UIViewController *)viewController;

- (void)addViewControllers:(UIViewController *)viewController;

- (void)startLoadingAnimation;


@end
