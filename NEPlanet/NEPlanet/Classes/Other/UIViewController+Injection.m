//
//  UIViewController+Injection.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/17.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "UIViewController+Injection.h"

@implementation UIViewController (Injection)
- (void)injected{
#if DEBUG
    for (UIView *subView in self.view.subviews) {
        [subView removeFromSuperview];
    }
    [self viewDidLoad];
#endif
}
@end
