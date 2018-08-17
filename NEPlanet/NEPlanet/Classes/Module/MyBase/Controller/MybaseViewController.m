//
//  MybaseViewController.m
//  NEPlanet
//
//  Created by lzcdev on 2018/8/15.
//  Copyright © 2018年 lzcdev. All rights reserved.
//

#import "MybaseViewController.h"
#import "MyBaseCollectionViewCell.h"
#import "NetWorkTool.h"
#import "NoticesAndJumpPagesModel.h"
#import "CommonWebViewViewController.h"
#import "DiamondView.h"
#import "MyBaseHeaderView.h"

static NSString * const iden = @"collectionCell";

@interface MybaseViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIView *diamondBgView;

@end

@implementation MybaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setView];
    [self getDataAndRefresh];
    [self coculatePosition];
}

- (void)getDataAndRefresh {
//    https://star.8.163.com/api/home/v2/noticesAndJumpPages
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"jump" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    id jsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    _dataSource = [NoticesAndJumpPagesModel mj_objectArrayWithKeyValuesArray:jsonObject[@"data"][@"jumpPages"][@"jumpPages"]];
    [_collectionView reloadData];
}

- (void)coculatePosition {
    int ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    // 思路，网格布局，总共长*宽个点，可选取范围边界-半径
    
    NSMutableSet *mSet = [NSMutableSet new];
    _diamondBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 200)];
    _diamondBgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_diamondBgView];
    
    for (int i = 0; i <= ScreenWidth-50; i++) {
        for (int j = 0; j <= 150; j++) {
            NSString *str = [NSString stringWithFormat:@"%d,%d",i,j];
            [mSet addObject:str];
        }
    }
    NSMutableArray *mArray = [NSMutableArray new];
    mArray = [[mSet allObjects] copy];
    
    int x, y;
    for (int i = 0; i < 10; i++) {
        if (mArray.count < 50*50) {
            return;
        }
        int r = arc4random() % mArray.count;
        x = [[mArray[r] componentsSeparatedByString:@","][0] intValue];
        y = [[mArray[r] componentsSeparatedByString:@","][1] intValue];
        [self addDiamondViewWithFrame:CGRectMake(x, y, 50, 50)];
        NSMutableSet *newSet = [NSMutableSet new];
        
        if (x < 50 && y < 50) {
            for (int m = 0; m <= x+50; m++) {
                for (int n = 0; n <= y+50; n++) {
                    NSString *str = [NSString stringWithFormat:@"%d,%d",m,n];
                    [newSet addObject:str];
                }
            }
        } else if (x < 50 && y >= 50) {
            for (int m = 0; m <= x+50; m++) {
                for (int n = y - 50; n <= y+50; n++) {
                    NSString *str = [NSString stringWithFormat:@"%d,%d",m,n];
                    [newSet addObject:str];
                }
            }
        } else if (x >= 50 && y < 50) {
            for (int m = x-50; m <= x+50; m++) {
                for (int n = 0; n <= y+50; n++) {
                    NSString *str = [NSString stringWithFormat:@"%d,%d",m,n];
                    [newSet addObject:str];
                }
            }
        } else if (x >= 50 && y >= 50) {
            for (int m = x-50; m <= x+50; m++) {
                for (int n = y-50; n <= y+50; n++) {
                    NSString *str = [NSString stringWithFormat:@"%d,%d",m,n];
                    [newSet addObject:str];
                }
            }
        } else {
            NSLog(@"什么情况");
        }
//        NSLog(@"%@", newSet);
        // 删除重复的元素
        [mSet minusSet:newSet];
        mArray = [[mSet allObjects] copy];
    }
}

// 添加一个钻石
- (void)addDiamondViewWithFrame:(CGRect)frame {
    DiamondView *diamandView = [[DiamondView alloc] initWithFrame: frame];
    [_diamondBgView addSubview:diamandView];
}

- (void)setView {

//    self.view.backgroundColor = [UIColor colorFromHexCode:@"#1B101B"];
    self.view.backgroundColor = [UIColor redColor];
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-210)];
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:@"https://i.epay.126.net/m/at/static/img/star.5c0c3b3.png"]];
    [self.view addSubview:_bgImageView];
    
    MyBaseHeaderView *headerView = [[MyBaseHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    [_bgImageView addSubview:headerView];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 10; //item左右间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //section之间的间距
    flowLayout.itemSize = CGSizeMake(140, 180);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bgImageView.frame)-50, [UIScreen mainScreen].bounds.size.width, 190) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[MyBaseCollectionViewCell class] forCellWithReuseIdentifier:iden];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:iden forIndexPath:indexPath];
    cell.model = _dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", [NSString stringWithFormat:@"%zd", indexPath.row]);
    CommonWebViewViewController *webView = [CommonWebViewViewController new];
    [self.navigationController pushViewController:webView animated:YES];
    
}

@end
