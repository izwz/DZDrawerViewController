//
//  DZBaseViewController.m
//  REFrostedVCDemo
//
//  Created by zwz on 2017/5/19.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import "DZBaseViewController.h"
#import "AppDelegate.h"

@interface DZBaseViewController ()

@end

@implementation DZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self == [self.navigationController.viewControllers firstObject]) {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(openLeft)];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
}



- (void)openLeft{
    [[AppDelegate shareInstance].drawerVC presentMenuViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
