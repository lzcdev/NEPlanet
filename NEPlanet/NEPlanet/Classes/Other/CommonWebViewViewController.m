//
//  CommonWebViewViewController.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/15.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "CommonWebViewViewController.h"

@interface CommonWebViewViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation CommonWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setWebView];
}

- (void)setWebView {
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    NSURL* url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];

}

@end
