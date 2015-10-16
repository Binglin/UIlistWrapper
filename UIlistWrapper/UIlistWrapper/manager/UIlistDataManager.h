//
//  UIlistDataManager.h
//  UIlistWrapper
//
//  Created by ET|冰琳 on 15/10/16.
//  Copyright © 2015年 BL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIlistSectionWrapper.h"

@interface UIlistDataManager : NSObject<UIlistSectionProtocol>

/***  UITableView UICollectionView的数据来源  初始化为 [NSMutableArray array]*/
@property (nonatomic, strong) NSMutableArray *dataSources;


#pragma mark - 数据操作
/***  indexPath对应cell的data  */
- ( id )dataAtIndexPath:(NSIndexPath *)indexPath;

/***  @param more  YES添加 NO删除所有再add数据*/
- (void)appendData:(NSArray *)datas withMore:(BOOL)more;

/***  判断数据是否为空*/
- (BOOL)isEmpty;

- (void)addObject:(id)object;
- (void)addObjectsFromArray:(NSArray *)array;



//[self.dataManager addObject:@"1"];


#pragma mark - 分页
/***  返回需要请求的pageIndex  @param more YES表示加载更多 NO表示刷新*/
- (int )pageIndexToRequestWithMore:(BOOL)more;
@property (nonatomic, assign) int pageIndex;//start is 1~server start is 1
@property (nonatomic, assign) int pageCount;//default 10

/***  是否是多section table  default NO*/
@property (nonatomic, assign) BOOL isMultipleSection;

@end

