//
//  HorizontalScrollTableViewCell.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/10/7.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "HorizontalScrollTableViewCell.h"

@implementation HorizontalScrollTableViewCell

- (UICollectionViewLayout *)collectionViewLayout{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake([self fixCellHeight], [self fixCellHeight]);
    return layout;
}

- (void)configurationCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor orangeColor];
    }
}

- (CGFloat)fixCellHeight{
    return [self.class fixCellHeight];
}

+ (CGFloat)fixCellHeight{
    return 80.f;
}

@end
