//
//  AppDelegate.h
//  DZDrawerViewController
//
//  Created by zwz on 2017/5/18.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDrawerViewController.h"
#import "DZMainViewController.h"
#import "DZAnotherViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong ,readonly) DZDrawerViewController  *drawerVC;

@property (nonatomic,strong) UINavigationController *mainNav;
@property (nonatomic,strong) UINavigationController *anotherNav;


+ (AppDelegate *)shareInstance;

- (void)openMain;

- (void)openAnother;

@end

