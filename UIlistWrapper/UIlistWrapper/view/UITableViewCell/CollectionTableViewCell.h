//
//  CollectionTableViewCell.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/10/7.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "WRlistWrapperDelegate.h"


@protocol CollectionTableViewCellDelegate <NSObject>

- (void)didSelectCell:(UITableViewCell *)cell collectionIndexPath:(NSIndexPath *)indexPath;

@end


@interface CollectionTableViewCell : BaseTableViewCell<UICollectionViewDataSource, UICollectionViewDelegate,WRlistWrapperDelegate,WRlistWrapperDataSource>

@property (nonatomic, readonly) UICollectionView *collectionView;


//data source & delegate & CollectionTableViewCellDelegate
@property (nonatomic, assign) UIViewController *collectionDelegates;

- (UICollectionViewLayout *)collectionViewLayout;

@end
