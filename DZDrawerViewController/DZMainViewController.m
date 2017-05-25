//
//  DZMainViewController.m
//  REFrostedVCDemo
//
//  Created by zwz on 2017/5/18.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import "DZMainViewController.h"
#import "AppDelegate.h"

@interface DZMainViewController ()

@end

@implementation DZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Main";

    
    UIButton *btnAction = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAction.frame = CGRectMake(100, 100, 100, 40);
    [btnAction setTitle:@"Main" forState:UIControlStateNormal];
    [btnAction setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btnAction];
    [btnAction addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)action{
    DZAnotherViewController *another = [[DZAnotherViewController alloc] init];
    [self.navigationController pushViewController:another animated:YES];
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
