//
//  AppDelegate.m
//  REFrostedVCDemo
//
//  Created by zwz on 2017/5/18.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import "AppDelegate.h"

#import "DZMenuViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


+ (AppDelegate *)shareInstance{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)openMain {
    [self.drawerVC presentViewController:self.mainNav];
}

- (void)openAnother {
    [self.drawerVC presentViewController:self.anotherNav];
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    DZMainViewController *main = [[DZMainViewController alloc] init];
    self.mainNav = [[UINavigationController alloc] initWithRootViewController:main];
    
    DZAnotherViewController *another = [[DZAnotherViewController alloc] init];
    self.anotherNav = [[UINavigationController alloc] initWithRootViewController:another];
    
    DZMenuViewController *menu = [[DZMenuViewController alloc] init];
    
    
    //    _frostedVC = [[REFrostedViewController alloc] initWithContentViewController:nav menuViewController:menu];
    
    
    _drawerVC = [[DZDrawerViewController alloc] initWithMenuViewController:menu];
    
    
    self.window.rootViewController = _drawerVC;
    [self.window makeKeyWindow];
    [self.window makeKeyAndVisible];
    
    //    [self openAnother];
    [self openMain];
    
    return YES;
}



@end
