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
    [self configUI];
#endif
}

- (void)configUI{
    NSAssert(YES, @"子类需要覆盖重写-(void)configUI，在这里配置UI");
}
@end
