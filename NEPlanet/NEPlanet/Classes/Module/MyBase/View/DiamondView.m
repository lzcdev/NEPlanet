//
//  DiamondView.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/17.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "DiamondView.h"

@interface DiamondView ()
@property (nonatomic, strong) UIImageView *diamondImageView;
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation DiamondView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
 
        [self setView];
        // 添加关键帧动画
        [self addKeyframeAnimation];
    }
    return self;
}



- (void)setView {
    _diamondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.height/8, 0, self.frame.size.height/4*3, self.frame.size.height/4*3)];
    _diamondImageView.image = [UIImage imageNamed:@"diamond"];
    _diamondImageView.layer.cornerRadius = self.frame.size.height/8*3;
    _diamondImageView.layer.masksToBounds = YES;
    [self addSubview:_diamondImageView];
    
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_diamondImageView.frame), self.frame.size.width, self.frame.size.height/4)];
    _textLabel.textColor = [UIColor whiteColor];
    _textLabel.font = [UIFont systemFontOfSize:11];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.text = @"0.07134";
    [self addSubview:_textLabel];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeSelf)];
    [self addGestureRecognizer:tap];
}

- (void)removeSelf {
    [self removeFromSuperview];
}

- (void)addKeyframeAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    CGFloat duration = 3.f;
    CGFloat height = 5.f;
    CGFloat currentY = self.transform.ty;
    animation.duration = duration;
    animation.values = @[@(currentY),@(currentY - height/4),@(currentY - height/4*2),@(currentY - height/4*3),@(currentY - height),@(currentY - height/ 4*3),@(currentY - height/4*2),@(currentY - height/4),@(currentY)];
    animation.keyTimes = @[ @(0), @(0.025), @(0.085), @(0.2), @(0.5), @(0.8), @(0.915), @(0.975), @(1) ];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:animation forKey:@"kViewShakerAnimationKey"];
}
@end
