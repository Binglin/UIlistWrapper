//
//  UIlistSectionWrapper.h
//  BaseTableViewController
//
//  Created by Zhenglinqin on 15/6/11.
//  Copyright (c) 2015年 Binglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIlistSectionWrapper;

typedef void(^SectionConfiguration)(UIlistSectionWrapper *wrapper);

@interface UIlistSectionWrapper : NSObject

@property (nonatomic, strong) NSString       *sectionTitle;
@property (nonatomic, strong) NSString       *headerIdentifier;

@property (nonatomic, strong) NSMutableArray *rowDatas;

@property (nonatomic, strong) UIView         *sectionHeaderView;
@property (nonatomic, strong) UIView         *sectionFooterView;
@property (nonatomic, assign) CGFloat        sectionHeaderHeight;//
@property (nonatomic, assign) CGFloat        sectionFooterHeight;


//有些section会隐藏 点击indexPath,需要sectionType来区分
@property (nonatomic, assign) NSInteger      sectionType;


+ (instancetype)wrapper;
+ (instancetype)wrapperWithRowDatas:(NSArray *)rowDatas;

//Section
+ (instancetype)wrapperWithConfiguration:(SectionConfiguration)wrapper;

- (UIlistSectionWrapper *)configuration:(SectionConfiguration)wrapper;

- (UIlistSectionWrapper * (^)(NSString *sectionTitle))wr_sectionTitle;
- (UIlistSectionWrapper * (^)(NSString *sectionTitle))wr_headerIdentifier;
- (UIlistSectionWrapper * (^)(NSMutableArray  *array))wr_rowDatas;


/**
 *  section header & footer
 */
- (UIlistSectionWrapper * (^)(UIView *headerView))wr_headerView;
- (UIlistSectionWrapper * (^)(UIView *footerView))wr_footerView;
- (UIlistSectionWrapper * (^)(CGFloat headerHeight))wr_headerHeight;
- (UIlistSectionWrapper * (^)(CGFloat footerHeight))wr_footerHeight;


- (UIlistSectionWrapper * (^)(NSInteger sectionValue))wr_sectionType;




@end
