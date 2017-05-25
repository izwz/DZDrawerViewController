//
//  DZDrawerViewController.h
//  DZDrawerViewController
//
//  Created by zwz on 2017/5/19.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZDrawerViewController : UIViewController

@property (nonatomic,strong,readonly) UIViewController *currentViewController;

@property (nonatomic,readonly,getter = isMenuOpening) BOOL menuOpening;

- (instancetype)initWithMenuViewController:(UIViewController *)viewController;

- (void)presentMenuViewController;

- (void)presentViewController:(UIViewController *)viewController;

- (void)dismissMenuViewController;

@end
