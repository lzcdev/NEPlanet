//
//  MyBaseCollectionViewCell.h
//  NEPlanet
//
//  Created by lzcdev on 2018/8/15.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticesAndJumpPagesModel.h"

@interface MyBaseCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) NoticesAndJumpPagesModel *model;
@end
