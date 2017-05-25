//
//  DZDrawerMenuContainerViewController.m
//  DZDrawerViewController
//
//  Created by zwz on 2017/5/19.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import "DZDrawerMenuContainerViewController.h"

#define kDZ_DRAWER_MENU_WIDTH  250 /* Menu 宽度*/
#define kDZ_DRAWER_MENU_ANIMAION_DURATION  0.3 /* 动画持续时间*/
#define kDZ_DRAWER_MENU_BG_ALPHA 0.1/* 空白处的透明度*/

#define kDZ_DRAWER_RECT_MENU_DISMISS   CGRectMake(- kDZ_DRAWER_MENU_WIDTH , 0, kDZ_DRAWER_MENU_WIDTH, [UIScreen mainScreen].bounds.size.height)
#define kDZ_DRAWER_RECT_MENU_SHOW CGRectMake(0 , 0, kDZ_DRAWER_MENU_WIDTH, [UIScreen mainScreen].bounds.size.height)
#define DZSafeBlockRun(block, ...)         block ? block(__VA_ARGS__) : nil

@interface DZDrawerMenuContainerViewController ()

@property (nonatomic,strong,readonly) UIViewController *menuViewController;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,assign) BOOL isAnimating;

@end

@implementation DZDrawerMenuContainerViewController

#pragma mark - init

- (instancetype)initWithMenuViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        _menuViewController = viewController;
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.bgView.backgroundColor = [UIColor blackColor];
    self.bgView.alpha = 0;
    [self.view addSubview:self.bgView];
    
    [self addChildViewController:self.menuViewController];
    [self.view addSubview:self.menuViewController.view];
    [self dismissMenuAnimated:NO completion:nil];
    
    self.menuViewController.view.layer.shadowOpacity = 0.5;
    self.menuViewController.view.layer.shadowColor = [UIColor grayColor].CGColor;
    self.menuViewController.view.layer.shadowRadius = 3;
    self.menuViewController.view.layer.shadowOffset = CGSizeMake(1, 1);
    
    [self.menuViewController didMoveToParentViewController:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgViewTapped:)];
    [self.bgView addGestureRecognizer:tap];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    [self.view addGestureRecognizer:pan];
    
}

- (void)didMoveToParentViewController:(nullable UIViewController *)parent {
    [self.view.superview bringSubviewToFront:self.view];
    [self showMenuAnimated:YES completion:nil];
}

#pragma mark - func

- (void)showMenuAnimated:(BOOL)animated completion:(DZDrawMenuAnimationBlock)completion {
    if (self.isAnimating) {
        return;
    }
    self.isAnimating = YES;
    [UIView animateWithDuration:animated ? kDZ_DRAWER_MENU_ANIMAION_DURATION : 0 animations:^{
        self.menuViewController.view.frame = kDZ_DRAWER_RECT_MENU_SHOW;
        self.bgView.alpha = kDZ_DRAWER_MENU_BG_ALPHA;
    } completion:^(BOOL finished) {
        DZSafeBlockRun(completion);
        self.isAnimating = NO;
    }];
}

- (void)dismissMenuAnimated:(BOOL)animated completion:(DZDrawMenuAnimationBlock)completion {
    if (self.isAnimating) {
        return;
    }
    self.isAnimating = YES;
    [UIView animateWithDuration:animated ? kDZ_DRAWER_MENU_ANIMAION_DURATION : 0 animations:^{
        self.menuViewController.view.frame = kDZ_DRAWER_RECT_MENU_DISMISS;
        self.bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view.superview sendSubviewToBack:self.view];
        DZSafeBlockRun(completion);
        self.isAnimating = NO;
    }];
}

- (void)bgViewTapped:(UITapGestureRecognizer *)tap {
    CGPoint touchPoint = [tap locationInView:self.bgView];
    if (touchPoint.x > kDZ_DRAWER_MENU_WIDTH) {
        [self dismissMenuAnimated:YES completion:nil];
    }
}

- (void)panned:(UIPanGestureRecognizer *)pan {
    CGPoint point = [pan translationInView:self.view];
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.menuViewController.view.frame = kDZ_DRAWER_RECT_MENU_SHOW;
    }else if (pan.state == UIGestureRecognizerStateChanged){
        CGRect rect = self.menuViewController.view.frame;
        rect.origin.x = kDZ_DRAWER_RECT_MENU_SHOW.origin.x + point.x;
        if (rect.origin.x < - kDZ_DRAWER_MENU_WIDTH) {
            rect.origin.x = - kDZ_DRAWER_MENU_WIDTH;
        }
        if (rect.origin.x > 0) {
            rect.origin.x = 0;
        }
        self.menuViewController.view.frame = rect;
    }else if (pan.state == UIGestureRecognizerStateEnded){
        if ([pan velocityInView:self.view].x < 0) {
            [self dismissMenuAnimated:YES completion:nil];
        } else {
            [self showMenuAnimated:YES completion:nil];
        }
    }
}

#pragma mark - memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

