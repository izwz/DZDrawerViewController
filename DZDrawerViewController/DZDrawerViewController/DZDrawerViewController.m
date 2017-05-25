//
//  DZDrawerViewController.m
//  DZDrawerViewController
//
//  Created by zwz on 2017/5/19.
//  Copyright © 2017年 zwz. All rights reserved.
//

#import "DZDrawerViewController.h"
#import "DZDrawerMenuContainerViewController.h"

@interface DZDrawerViewController ()

@property (nonatomic,strong)UIViewController *menuViewController;

@property (nonatomic,strong)DZDrawerMenuContainerViewController *menuContainerViewController;

@end

@implementation DZDrawerViewController

#pragma mark - init

- (instancetype)initWithMenuViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        _menuViewController = viewController;
        self.menuContainerViewController = [[DZDrawerMenuContainerViewController alloc] initWithMenuViewController:viewController];
    }
    return self;
}

#pragma mark - func

- (void)presentMenuViewController {
    [self presentViewController:self.menuContainerViewController];
}

- (void)presentViewController:(UIViewController *)viewController {
    if (![self.childViewControllers containsObject:viewController]) {
        [self addChildViewController:viewController];
        [self.view addSubview:viewController.view];
    }
    
    if (_menuOpening) {
        [self.view bringSubviewToFront:self.menuContainerViewController.view];
    }
    
    if (viewController != self.menuContainerViewController) {
        _currentViewController = viewController;
        [self dismissMenuViewController];
        _menuOpening = NO;
    }else{
        _menuOpening = YES;
    }
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj != self.menuContainerViewController) {
            obj.view.hidden = YES;
        }
    }];
    self.currentViewController.view.hidden = NO;
    [viewController didMoveToParentViewController:self];
}

- (void)dismissMenuViewController {
    [self.menuContainerViewController dismissMenuAnimated:YES completion:nil];
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

+ (void)attemptRotationToDeviceOrientation {
    
}

- (BOOL)shouldAutorotate {
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
// Returns interface orientation masks.
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - memory handle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
