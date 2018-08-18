//
//  DiamondTool.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/17.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "DiamondTool.h"
#import "DiamondView.h"

@interface DiamondTool ()
@end

@implementation DiamondTool

+ (void)addDiamondWithObj:(MybaseViewController *)obj {
    [obj.diamondBgView removeFromSuperview];
    
    int ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    NSMutableSet *originalSet = [NSMutableSet new];

    obj.diamondBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 200)];
    obj.diamondBgView.backgroundColor = [UIColor clearColor];
    [obj.view addSubview:obj.diamondBgView];

    for (int i = 0; i <= ScreenWidth-50; i++) {
        for (int j = 0; j <= 150; j++) {
            NSString *coordinateString = [NSString stringWithFormat:@"%d,%d", i, j];
            [originalSet addObject:coordinateString];
        }
    }
    NSMutableArray *mArray = [NSMutableArray new];
    mArray = [[originalSet allObjects] copy];
    
    int x, y;
    for (int i = 0; i < arc4random() % 20 + 5; i++) {
        if (mArray.count < 50*50) {
            return;
        }
        int r = arc4random() % mArray.count;
        x = [[mArray[r] componentsSeparatedByString:@","][0] intValue];
        y = [[mArray[r] componentsSeparatedByString:@","][1] intValue];
        [self addDiamondViewWithFrame:CGRectMake(x, y, 50, 50) withObj:obj];
      
        NSMutableSet *uselessSet = [NSMutableSet new];
        
        if (x < 50 && y < 50) {
            for (int m = 0; m <= x+50; m++) {
                for (int n = 0; n <= y+50; n++) {
                    [self addUselessCoordinateStringWithm:m n:n uselessSet:uselessSet];
                    
                }
            }
        } else if (x < 50 && y >= 50) {
            for (int m = 0; m <= x+50; m++) {
                for (int n = y - 50; n <= y+50; n++) {
                    [self addUselessCoordinateStringWithm:m n:n uselessSet:uselessSet];
                    
                }
            }
        } else if (x >= 50 && y < 50) {
            for (int m = x-50; m <= x+50; m++) {
                for (int n = 0; n <= y+50; n++) {
                    [self addUselessCoordinateStringWithm:m n:n uselessSet:uselessSet];
                    
                }
            }
        } else if (x >= 50 && y >= 50) {
            for (int m = x-50; m <= x+50; m++) {
                for (int n = y-50; n <= y+50; n++) {
                    [self addUselessCoordinateStringWithm:m n:n uselessSet:uselessSet];
                }
            }
        } else {
            NSLog(@"什么情况");
        }
        // 删除重复的元素
        [originalSet minusSet:uselessSet];
        mArray = [[originalSet allObjects] copy];
    }
}

// 添加不能用的坐标
+ (void)addUselessCoordinateStringWithm:(int)m n:(int)n uselessSet:(NSMutableSet *)uselessSet{
    NSString *str = [NSString stringWithFormat:@"%d,%d",m,n];
    [uselessSet addObject:str];
}

// 添加一个钻石
+ (void)addDiamondViewWithFrame:(CGRect)frame withObj:(MybaseViewController *)obj {
    DiamondView *diamandView = [[DiamondView alloc] initWithFrame: frame];
    [obj.diamondBgView addSubview:diamandView];
}
@end
