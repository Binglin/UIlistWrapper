//
//  UIlistCellWrapper.h
//  BLExampleWorkspace
//
//  Created by 郑林琴 on 15/7/1.
//  Copyright (c) 2015年 Binglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PropertyMacros.h"

/**
 *  @param cell UITableViewCell
 */
typedef void(^CellConfiguration)(id cell);

@interface UIlistCellWrapper : NSObject

PropertyString(title);
PropertyString(detailText);
PropertyString(imageName);
PropertyAssign(CGFloat, cellHeight);
PropertyCopy__(CellConfiguration, cellConfiguration);
PropertyCopy__(dispatch_block_t , select_block_t);

@property Class cellClass;
PropertyString(cellIdentifier);



+ (instancetype)wrapper;
- (instancetype)configuration:(CellConfiguration)cellConfiguration;


#pragma mark - Chaining

- (UIlistCellWrapper * (^)(NSString *title))wr_title;

- (UIlistCellWrapper * (^)(NSString *detail))wr_detail;

- (UIlistCellWrapper * (^)(NSString *imageName))wr_imageName;

- (UIlistCellWrapper * (^)(CGFloat cellHeight))wr_cellHeight;

- (UIlistCellWrapper * (^)(CellConfiguration configuration))wr_cellConfiguration;

- (UIlistCellWrapper * (^)(dispatch_block_t selectBlock))wr_select_block_t;

//- (UIlistCellWrapper *)s_title:(NSString *(^)(void))_title;

@end

