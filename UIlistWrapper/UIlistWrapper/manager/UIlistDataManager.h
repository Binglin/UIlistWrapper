//
//  UIlistDataManager.h
//  UIlistWrapper
//
//  Created by ET|冰琳 on 15/10/16.
//  Copyright © 2015年 BL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIlistDataManager : NSObject

/***  UITableView UICollectionView的数据来源  初始化为 [NSMutableArray array]*/
@property (nonatomic, strong) NSMutableArray *dataSources;


#pragma mark - 数据操作
/***  indexPath对应cell的data  */
- ( id )dataAtIndexPath:(NSIndexPath *)indexPath;

/***  @param more  YES添加 NO删除所有再add数据*/
- (void)appendData:(NSArray *)datas withMore:(BOOL)more;

- (void)addObject:(id)object;
- (void)addObjectsFromArray:(NSArray *)array;


/***  是否是多section table  default NO*/
@property (nonatomic, assign) BOOL isMultipleSection;

- (NSUInteger)sectionCount;
- (NSUInteger)rowCountInSection:(NSUInteger)section;

@end

