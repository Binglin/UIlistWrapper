//
//  CollectionTableViewCell.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/10/7.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "CollectionTableViewCell.h"
#import "UICollectionViewCell+setItem.h"

@interface CollectionTableViewCell ()

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end


@implementation CollectionTableViewCell
@synthesize dataManager;


- (void)layoutSubviews{
    [super layoutSubviews];
    self.collectionView.frame = [self listFrame];
}



- (void)setUpViews{
    if (!self.collectionView) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:[self listFrame] collectionViewLayout:[self collectionViewLayout]];
        self.collectionView.backgroundColor  = [UIColor whiteColor];
        [self.contentView addSubview:self.collectionView];
    }
    
    if (self.collectionView.dataSource == nil) {
        self.collectionView.dataSource = self;
    }
    
    if (self.collectionView.delegate == nil) {
        self.collectionView.delegate   = self;
    }
    
    [self registerCells];
    
    self.dataManager = [UIlistDataManager new];
}



- (UICollectionViewLayout *)collectionViewLayout{
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake(20, 20);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    return flowLayout;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataManager countOfSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [self identifierAtIndexPath:indexPath];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];

    [cell setItem:[self.dataManager dataAtIndexPath:indexPath]];
    
    [self configurationCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configurationCell:(id)cell atIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath{
    return NSStringFromClass([UICollectionViewCell class]);
}



#pragma mark - WRlistWrapperDelegate

- (void)registerCells{
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}

- (CGRect)listFrame{
    return self.bounds;
}



@end
