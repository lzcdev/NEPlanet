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
//    self.backgroundColor = [UIColor orangeColor];
    
    _userBgImageView = [UIImageView new];
    _userBgImageView.backgroundColor = [UIColor colorFromHexCode:@"#2C254C"];
    _userBgImageView.layer.cornerRadius = 13;
    _userBgImageView.layer.masksToBounds = YES;
    [self addSubview:_userBgImageView];
    
    _iconImageView = [UIImageView new];
    _iconImageView.backgroundColor = [UIColor pumpkinColor];
    _iconImageView.layer.cornerRadius = 13;
    _iconImageView.layer.masksToBounds = YES;
    [_userBgImageView addSubview:_iconImageView];
    
    _nameTextLab = [UILabel new];
    _nameTextLab.text = @"星球居民";
    _nameTextLab.textColor = [UIColor whiteColor];
    _nameTextLab.font = [UIFont systemFontOfSize:10];
    [_userBgImageView addSubview:_nameTextLab];
    
    
    _diamondBgImageView = [UIImageView new];
    _diamondBgImageView.backgroundColor = [UIColor colorFromHexCode:@"#2C254C"];
    _diamondBgImageView.layer.cornerRadius = 13;
    _diamondBgImageView.layer.masksToBounds = YES;
    [self addSubview:_diamondBgImageView];
   
    _diamondImageView = [UIImageView new];
    //    _iconImageView.image = [UIImage imageNamed:@""];
    _diamondImageView.backgroundColor = [UIColor pumpkinColor];
    _diamondImageView.layer.cornerRadius = 13;
    _diamondImageView.layer.masksToBounds = YES;
    [_diamondBgImageView addSubview:_diamondImageView];
    
    _diamondTextLab = [UILabel new];
    _diamondTextLab.text = @"黑钻 55.56158";
    _diamondTextLab.textColor = [UIColor whiteColor];
    _diamondTextLab.font = [UIFont systemFontOfSize:10];
    [_diamondBgImageView addSubview:_diamondTextLab];
    
    _forceImageView = [UIImageView new];
    //    _iconImageView.image = [UIImage imageNamed:@""];
    _forceImageView.backgroundColor = [UIColor pumpkinColor];
    _forceImageView.layer.cornerRadius = 13;
    _forceImageView.layer.masksToBounds = YES;
    [_diamondBgImageView addSubview:_forceImageView];
    
    _forceTextLab = [UILabel new];
    _forceTextLab.text = @"原力 572";
    _forceTextLab.textColor = [UIColor whiteColor];
    _forceTextLab.font = [UIFont systemFontOfSize:10];
    [_diamondBgImageView addSubview:_forceTextLab];
  
    _noticeBgImageView = [UIImageView new];
    _noticeBgImageView.backgroundColor = [UIColor colorFromHexCode:@"#2C254C"];
    _noticeBgImageView.layer.cornerRadius = 13;
    _noticeBgImageView.layer.masksToBounds = YES;
    [self addSubview:_noticeBgImageView];
    
    _hornImageView = [UIImageView new];
    //    _iconImageView.image = [UIImage imageNamed:@""];
    _hornImageView.backgroundColor = [UIColor pumpkinColor];
    _hornImageView.layer.cornerRadius = 13;
    _hornImageView.layer.masksToBounds = YES;
    [_noticeBgImageView addSubview:_hornImageView];
    
    _userBgImageView.sd_layout.leftSpaceToView(self, 10).topSpaceToView(self, 5).heightIs(26).widthIs(80);
    _iconImageView.sd_layout.leftSpaceToView(_userBgImageView, 0).topSpaceToView(_userBgImageView, 0).heightIs(26).widthIs(26);
    _nameTextLab.sd_layout.leftSpaceToView(_iconImageView, 5).topSpaceToView(_userBgImageView, 3).heightIs(20);
    
    _diamondBgImageView.sd_layout.leftSpaceToView(_userBgImageView, 30).topSpaceToView(self, 5).rightSpaceToView(self, 10).heightIs(26);
    _diamondImageView.sd_layout.leftSpaceToView(_diamondBgImageView, 0).topSpaceToView(_diamondBgImageView, 0).heightIs(26).widthIs(26);
    _diamondTextLab.sd_layout.leftSpaceToView(_diamondImageView, 5).topSpaceToView(_diamondBgImageView, 3).heightIs(20);
    _forceImageView.sd_layout.leftSpaceToView(_diamondTextLab, 5).topSpaceToView(_diamondBgImageView, 0).heightIs(26).widthIs(26);
    _forceTextLab.sd_layout.leftSpaceToView(_forceImageView, 5).topSpaceToView(_diamondBgImageView, 3).heightIs(20);
    
    _noticeBgImageView.sd_layout.leftSpaceToView(self, 10).topSpaceToView(_userBgImageView, 10).rightSpaceToView(self, 10).heightIs(26);
    _hornImageView.sd_layout.leftSpaceToView(_noticeBgImageView, 0).topSpaceToView(_noticeBgImageView, 0).heightIs(26).widthIs(26);
    
    
    [_nameTextLab setSingleLineAutoResizeWithMaxWidth:60];
    [_diamondTextLab setSingleLineAutoResizeWithMaxWidth:100];
    [_forceTextLab setSingleLineAutoResizeWithMaxWidth:100];

}

@end
