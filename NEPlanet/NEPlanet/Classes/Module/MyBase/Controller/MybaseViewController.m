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
#import "MyBaseHeaderView.h"
#import "DiamondTool.h"

static NSString * const iden = @"collectionCell";

@interface MybaseViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation MybaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 添加钻石
    [DiamondTool addDiamondWithObj: self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setView];
    [self getDataAndRefresh];
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

- (void)setView {
    
    self.view.backgroundColor = [UIColor colorFromHexCode:@"#1B101B"];
    
    MyBaseHeaderView *headerView = [[MyBaseHeaderView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.view addSubview:headerView];
    
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-210)];
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:@"https://i.epay.126.net/m/at/static/img/star.5c0c3b3.png"]];
    [self.view addSubview:_bgImageView];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 10; //item左右间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //section之间的间距
    flowLayout.itemSize = CGSizeMake(140, 170);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bgImageView.frame)-80, [UIScreen mainScreen].bounds.size.width, 190) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
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
