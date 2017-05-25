//
//  DZMenuViewController.m
//  REFrostedVCDemo
//
//  Created by zwz on 2017/5/18.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import "DZMenuViewController.h"
#import "DZMainViewController.h"
#import "DZAnotherViewController.h"
#import "AppDelegate.h"

@interface DZMenuViewController ()

@end

@implementation DZMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.alpha = 0.7;
    
    UIButton *btnMain = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMain.frame = CGRectMake(20, 100, 100, 40);
    [btnMain setTitle:@"Main" forState:UIControlStateNormal];
    [btnMain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btnMain];
    [btnMain addTarget:self action:@selector(openMain) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnAnother = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAnother.frame = CGRectMake(20, 300, 100, 40);
    [btnAnother setTitle:@"Another" forState:UIControlStateNormal];
    [btnAnother setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btnAnother];
    [btnAnother addTarget:self action:@selector(openAnother) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)openMain{
    [[AppDelegate shareInstance] openMain];
}

- (void)openAnother{
    [[AppDelegate shareInstance] openAnother];
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
