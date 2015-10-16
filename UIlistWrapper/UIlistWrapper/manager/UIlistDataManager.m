//
//  UIlistDataManager.m
//  UIlistWrapper
//
//  Created by ET|冰琳 on 15/10/16.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "UIlistDataManager.h"
#import <UIKit/UIKit.h>

@implementation UIlistDataManager

- (instancetype)init{
    if (self = [super init]) {
        self.dataSources = [NSMutableArray new];
        self.pageCount   = 10;
    }
    return self;
}

#pragma mark - 数据操作
/***  indexPath对应cell的data  */
- ( id )dataAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isMultipleSection) {
        return self.dataSources[indexPath.section][indexPath.row];
    }
    return self.dataSources[indexPath.row];
}


/***  @param more  YES添加 NO删除所有再add数据*/
- (void)appendData:(NSArray *)datas withMore:(BOOL)more{
    if (more == NO) {
        [self.dataSources removeAllObjects];
    }
    [self.dataSources addObjectsFromArray:datas];
}

/***  判断数据是否为空*/
- (BOOL)isEmpty{
    return self.count == 0;
}

- (NSUInteger)count{
    if (self.isMultipleSection) {
        return self.dataSources.count;
    }
    return 1;
}

- (NSUInteger)countOfSection:(NSUInteger)section{
    if (self.isMultipleSection) {
        return [self.dataSources[section] count];
    }
    return self.dataSources.count;
}

- (void)addObject:(id)object{
    [self.dataSources addObject:object];
}

- (void)addObjectsFromArray:(NSArray *)array{
    [self.dataSources addObjectsFromArray:array];
}


#pragma mark - 分页
/***  返回需要请求的pageIndex  @param more YES表示加载更多 NO表示刷新*/
- (int )pageIndexToRequestWithMore:(BOOL)more{
    if ((more == NO) || (self.pageIndex == 0)) {
        return 1;
    }
    //request more index
    return self.pageIndex + 1;
}

@end
