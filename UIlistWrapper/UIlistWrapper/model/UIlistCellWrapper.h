//
//  UIlistCellWrapper.h
//  BLExampleWorkspace
//
//  Created by 郑林琴 on 15/7/1.
//  Copyright (c) 2015年 Binglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UIlistCellWrapper;

/**
 *  @param cell UITableViewCell
 */
typedef void(^UKCellIndexBlock)(NSIndexPath *indexPath);
typedef void(^CellConfiguration)(UITableViewCell * cell);
typedef void(^WrapperConfiguration)(UIlistCellWrapper * wrapper);


@interface UIlistCellWrapper : NSObject

@property (nonatomic, copy  ) NSString                     *title;
@property (nonatomic, copy  ) NSString                     *detailText;

@property (nonatomic, copy  ) NSString                     *imageName;

@property (nonatomic, assign) CGFloat                      cellHeight;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

@property (nonatomic, copy  ) CellConfiguration            cellConfiguration;
@property (nonatomic, copy  ) dispatch_block_t             select_block_t;
@property (nonatomic, copy  ) UKCellIndexBlock             selectIndexPath_block;

@property Class cellClass;
@property (nonatomic, copy  ) NSString                     * cellIdentifier;



+ (instancetype)wrapper;
+ (instancetype)wr_make:(WrapperConfiguration)wrapperConfiguration;

+ (instancetype)wrapperWithTitle:(NSString *)title;
- (instancetype)configurationCell:(CellConfiguration)cellConfiguration;

#pragma mark - Chaining

- (UIlistCellWrapper * (^)(NSString *title))wr_title;

- (UIlistCellWrapper * (^)(NSString *detail))wr_detail;

- (UIlistCellWrapper * (^)(NSString *imageName))wr_imageName;

- (UIlistCellWrapper * (^)(CGFloat cellHeight))wr_cellHeight;

- (UIlistCellWrapper * (^)(Class   className))wr_cellClass;

- (UIlistCellWrapper * (^)(CellConfiguration configuration))wr_cellConfiguration;

- (UIlistCellWrapper * (^)(UKCellIndexBlock selectBlock))wr_selectIndexPath_block;

- (UIlistCellWrapper * (^)(dispatch_block_t selectBlock))wr_select_block_t;

@end

