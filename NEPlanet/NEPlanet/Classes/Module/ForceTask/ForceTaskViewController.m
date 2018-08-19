//
//  ForceTaskViewController.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/15.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "ForceTaskViewController.h"

@interface ForceTaskViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation ForceTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _count = 100;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 1000, 20)];
    _label.text = @"123456789123456789123456789123456789";
    _label.backgroundColor = [UIColor clearColor];
    [view addSubview:_label];
    
     _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(loop)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)loop {
    NSLog(@"1");
    _label.frame = CGRectMake(_count--, 0, 1000, 20);
}

- (void)dealloc {
    [_link invalidate];
    _link = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_link invalidate];
    _link = nil;
}

- (void)viewWillDisappear:(BOOL)animated {
    [_link invalidate];
    _link = nil;
}
@end
