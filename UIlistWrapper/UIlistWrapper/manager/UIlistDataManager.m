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
    
    if ([datas isKindOfClass:[NSArray class]]) {
        if (more == NO) {
            [self.dataSources removeAllObjects];
        }
        [self.dataSources addObjectsFromArray:datas];
    }else{
        NSLog(@"@warning !!!!!!!!!!!!!!!!!!wrong formate!!!!!!!!!!!!!!!!!!!!!");
    }
}

- (NSUInteger)sectionCount{
    if (self.isMultipleSection) {
        return self.dataSources.count;
    }
    return 1;
}

- (NSUInteger)rowCountInSection:(NSUInteger)section{
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

@end
