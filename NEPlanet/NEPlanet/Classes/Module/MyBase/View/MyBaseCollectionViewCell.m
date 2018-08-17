//
//  MyBaseCollectionViewCell.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/15.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "MyBaseCollectionViewCell.h"

@interface MyBaseCollectionViewCell ()
@property (nonatomic, strong) UILabel *headTitleLab;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UILabel *whiteTitleLab;
@property (nonatomic, strong) UILabel *subTitleLab;
@property (nonatomic, strong) UILabel *lineLab;
@property (nonatomic, strong) UILabel *lookTitleLab;

@end

@implementation MyBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setView];
    }
    return self;
}

- (void)setView {
    
    self.layer.cornerRadius = 8;
    self.backgroundColor = [UIColor colorFromHexCode:@"#282242"];
    
    
    _headTitleLab = [UILabel new];
    _headTitleLab.textColor = [UIColor colorFromHexCode:@"#796D97"];
    _headTitleLab.textAlignment = NSTextAlignmentCenter;
    _headTitleLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:_headTitleLab];
    
    _centerImageView = [UIImageView new];
    [self addSubview:_centerImageView];
    
    _whiteTitleLab = [UILabel new];
    _whiteTitleLab.textColor = [UIColor whiteColor];
    _whiteTitleLab.textAlignment = NSTextAlignmentCenter;
    _whiteTitleLab.font = [UIFont systemFontOfSize:15];
    [self addSubview:_whiteTitleLab];
    
    _subTitleLab = [UILabel new];
    _subTitleLab.textColor = [UIColor colorFromHexCode:@"#796D97"];
    _subTitleLab.textAlignment = NSTextAlignmentCenter;
    _subTitleLab.font = [UIFont systemFontOfSize:11];
    [self addSubview:_subTitleLab];
    
    _lineLab = [UILabel new];
    _lineLab.backgroundColor = [UIColor colorFromHexCode:@"#2F2949"];
    [self addSubview:_lineLab];
    
    _lookTitleLab = [UILabel new];
    _lookTitleLab.text = @"查看";
    _lookTitleLab.textColor = [UIColor whiteColor];
    _lookTitleLab.textAlignment = NSTextAlignmentCenter;
    _lookTitleLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:_lookTitleLab];
    
    _headTitleLab.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(self, 10).heightIs(20);
    _centerImageView.sd_layout.centerXEqualToView(self).topSpaceToView(_headTitleLab, 5).heightIs(50).widthIs(50);
    _whiteTitleLab.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(_centerImageView, 5).heightIs(20);
    _subTitleLab.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(_whiteTitleLab, 5).heightIs(20);
    _lineLab.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(_subTitleLab, 8).heightIs(1);
    _lookTitleLab.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(_lineLab, 8).heightIs(20);
    
}

- (void)setModel:(NoticesAndJumpPagesModel *)model {
    [_centerImageView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    _headTitleLab.text = model.title;
    _whiteTitleLab.text = model.name;
    _subTitleLab.text = model.desc;
}
@end
