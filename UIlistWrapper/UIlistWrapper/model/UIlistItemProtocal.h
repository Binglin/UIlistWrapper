//
//  UIlistItemProtocal.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/5.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIlistItemProtocal <NSObject>

@optional
@property (nonatomic, assign) id dataItem;

@required
- (void)setItem:(id)item;

@optional

+ (CGFloat)fixCellHeight;//for UITableViewCell      固定高度使用
+ (CGSize )fixCellSize  ;//for UICollectionViewCell 固定大小时使用
@end





@protocol UIlistWrapperProtocol <NSObject>

- (id)dataAtIndexPath:(NSIndexPath *)indexPath;
- (id)dataAtSection:(NSInteger)section;

@end
