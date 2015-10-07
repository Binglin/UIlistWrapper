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
    if (!self.isMultiSection) {
        return self.dataSources.count;
    }
    return [self.dataSources[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [self identifierAtIndexPath:indexPath];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];

    [cell setItem:[self dataAtIndexPath:indexPath]];
    
    [self configurationCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configurationCell:(id)cell atIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath{
    return NSStringFromClass([UICollectionViewCell class]);
}



#pragma mark - WRlistWrapperDelegate
@synthesize dataSources;
@synthesize isMultiSection;

- (BOOL)isMultiSection{
    return NO;
}

- (id)dataAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isMultiSection) {
        return self.dataSources[indexPath.section][indexPath.row];
    }
    return self.dataSources[indexPath.row];
}

- (void)registerCells{
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}

- (CGRect)listFrame{
    return self.bounds;
}



@end
