//
//  WRCollectionViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/1.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import "WRCollectionViewController.h"
#import "UICollectionViewCell+setItem.h"

@interface WRCollectionViewController ()

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end

@implementation WRCollectionViewController
@synthesize isMultiSection;
@synthesize dataSources;


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.isMultiSection) {
        return self.dataSources.count;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.isMultiSection) {
        return [self.dataSources[section] count];
    }
    return self.dataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:[self identifierAtIndexPath:indexPath] forIndexPath:indexPath];
    [collectionCell setItem:[self dataAtIndexPath:indexPath]];
    [self configurationCell:collectionCell atIndexPath:indexPath];
    return collectionCell;
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath{
    return @"UICollectionViewCell";
}

- (void)configurationCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - data
- (id)dataAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isMultiSection) {
        return self.dataSources[indexPath.section][indexPath.row];
    }
    return self.dataSources[indexPath.row];
}

#pragma mark - setUp
- (void)setUpCollectionView{
    //没有collectionView
    if (self.collectionView == nil) {
        
        //但是xib或者storyboard中有collectionView 但是没有和self.collectionView进行关联的情况下
        [self.view.subviews enumerateObjectsUsingBlock:^(UIView *  obj, NSUInteger idx, BOOL * stop) {
            if ([obj isKindOfClass:[UICollectionView class]]) {
                UICollectionView *table = (UICollectionView *)obj;
                self.collectionView = table;
                *stop = YES;
            }
        }];
        
        //xib或者storyboard中没有collectionView
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[self collectionViewLayout]];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.collectionView];
    }
    
    if (self.collectionView.delegate == nil) {
        self.collectionView.delegate = self;
    }
    if (self.collectionView.dataSource == nil) {
        self.collectionView.dataSource = self;
    }
}

- (void)loadView{
    [super loadView];
    self.dataSources = [NSMutableArray new];
    [self setUpCollectionView];
    [self registerCells];
}

- (UICollectionViewLayout *)collectionViewLayout{
    return [UICollectionViewFlowLayout new];
}

- (void)registerCells{
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}

@end
