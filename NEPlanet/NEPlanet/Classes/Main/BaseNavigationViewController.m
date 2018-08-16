//
//  BaseNavigationViewController.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/15.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize {
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, 0, 44, 44);
        [_backBtn setImage:[UIImage imageNamed:@"navbar_back_normal"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"navbar_back_high"] forState:UIControlStateHighlighted];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backBtn];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
