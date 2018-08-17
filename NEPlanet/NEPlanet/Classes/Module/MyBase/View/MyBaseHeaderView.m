//
//  MyBaseHeaderView.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/17.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "MyBaseHeaderView.h"

@interface MyBaseHeaderView ()
@property (nonatomic, strong) UIImageView *userBgImageView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameTextLab;

@property (nonatomic, strong) UIImageView *diamondBgImageView;
@property (nonatomic, strong) UIImageView *diamondImageView;
@property (nonatomic, strong) UIImageView *forceImageView;
@property (nonatomic, strong) UILabel *diamondTextLab;
@property (nonatomic, strong) UILabel *forceTextLab;

@property (nonatomic, strong) UIImageView *noticeBgImageView;
@property (nonatomic, strong) UIImageView *hornImageView;
@property (nonatomic, strong) UIButton *moreBtn;

@end

@implementation MyBaseHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setView];

    }
    return self;
}

- (void)setView {
    self.backgroundColor = [UIColor orangeColor];
    
    _userBgImageView = [UIImageView new];
    _userBgImageView.image = [UIImage imageNamed:@""];
    _userBgImageView.backgroundColor = [UIColor colorFromHexCode:@"#2C254C"];
    [self addSubview:_userBgImageView];
    
    _iconImageView = [UIImageView new];
    _iconImageView.image = [UIImage imageNamed:@""];
    _iconImageView.backgroundColor = [UIColor greenColor];
    
    _iconImageView.layer.cornerRadius = 10;
    _iconImageView.layer.masksToBounds = YES;
    [_userBgImageView addSubview:_iconImageView];
    
//    _userBgImageView = [UIImageView new];
//    _userBgImageView.image = [UIImage imageNamed:@""];
//    _userBgImageView.backgroundColor = [UIColor colorFromHexCode:@"#2C254C"];
//    [self addSubview:_userBgImageView];
    
    _userBgImageView.sd_layout.leftSpaceToView(self, 10).topSpaceToView(self, 5).heightIs(20).widthIs(60);
    _iconImageView.sd_layout.leftSpaceToView(_userBgImageView, 0).topSpaceToView(_userBgImageView, 5).heightIs(20).widthIs(20);
    
}

@end
