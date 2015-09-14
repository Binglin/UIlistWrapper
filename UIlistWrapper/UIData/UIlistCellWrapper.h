//
//  UIlistCellWrapper.h
//  BLExampleWorkspace
//
//  Created by 郑林琴 on 15/7/1.
//  Copyright (c) 2015年 Binglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  @param cell UITableViewCell
 */
typedef void(^CellConfiguration)(id cell);

@interface UIlistCellWrapper : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailText;

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, copy) CellConfiguration cellConfiguration;
@property (nonatomic, copy) dispatch_block_t select_block_t;

@property Class cellClass;
@property (nonatomic, copy) NSString * cellIdentifier;



+ (instancetype)wrapper;
- (instancetype)configuration:(CellConfiguration)cellConfiguration;


#pragma mark - Chaining

- (UIlistCellWrapper * (^)(NSString *title))wr_title;

- (UIlistCellWrapper * (^)(NSString *detail))wr_detail;

- (UIlistCellWrapper * (^)(NSString *imageName))wr_imageName;

- (UIlistCellWrapper * (^)(CGFloat cellHeight))wr_cellHeight;

- (UIlistCellWrapper * (^)(CellConfiguration configuration))wr_cellConfiguration;

- (UIlistCellWrapper * (^)(dispatch_block_t selectBlock))wr_select_block_t;

@end

