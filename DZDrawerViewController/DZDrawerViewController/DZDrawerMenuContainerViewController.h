//
//  DZDrawerMenuContainerViewController.h
//  REFrostedVCDemo
//
//  Created by zwz on 2017/5/19.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DZDrawMenuAnimationBlock)();

@interface DZDrawerMenuContainerViewController : UIViewController

- (instancetype)initWithMenuViewController:(UIViewController *)viewController;

- (void)showMenuAnimated:(BOOL)animated completion:(DZDrawMenuAnimationBlock)completion;

- (void)dismissMenuAnimated:(BOOL)animated completion:(DZDrawMenuAnimationBlock)completion;

@end
