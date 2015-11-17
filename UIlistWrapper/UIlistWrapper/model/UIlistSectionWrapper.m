//
//  UIlistSectionWrapper.m
//  BaseTableViewController
//
//  Created by Zhenglinqin on 15/6/11.
//  Copyright (c) 2015年 Binglin. All rights reserved.
//

#import "UIlistSectionWrapper.h"

@implementation UIlistSectionWrapper

- (instancetype)init{
    if (self = [super init]) {
        _sectionHeaderHeight = 0.001f;
        _sectionFooterHeight = 0.001f;
    }
    return self;
}

#pragma mark - wrapper
+ (instancetype)wrapper{
    return [self new];
}

+ (instancetype)wrapperWithRowDatas:(NSArray *)rowDatas{
    UIlistSectionWrapper *sectionData = [UIlistSectionWrapper new];
    sectionData.rowDatas = rowDatas.mutableCopy;
    return sectionData;
}

+ (instancetype)wrapperWithConfiguration:(SectionConfiguration)wrapper{
    UIlistSectionWrapper *section_wrapper = [self wrapper];
    if (wrapper) {
        wrapper(section_wrapper);
    }
    return section_wrapper;
}

- (UIlistSectionWrapper *)configuration:(SectionConfiguration)wrapper{
    if (wrapper) {
        wrapper(self);
    }
    return self;
}

#pragma mark - properties
- (UIlistSectionWrapper *(^)(NSString *))wr_sectionTitle{
    return ^id(NSString *title){
        self.sectionTitle = title;
        return self;
    };
}

- (UIlistSectionWrapper *(^)(NSString *))wr_headerIdentifier{
    return ^id(NSString *identifier){
        self.headerIdentifier = identifier;
        return self;
    };
}

- (UIlistSectionWrapper *(^)(NSMutableArray *))wr_rowDatas{
    return ^id(NSMutableArray *datas){
        self.rowDatas = datas;
        return self;
    };
}

- (UIlistSectionWrapper *(^)(UIView *))wr_headerView{
    return ^id(UIView *header){
        self.sectionHeaderView = header;
        return self;
    };
}

- (UIlistSectionWrapper *(^)(UIView *))wr_footerView{
    return ^id(UIView *footer){
        self.sectionFooterView = footer;
        return self;
    };
}

- (UIlistSectionWrapper *(^)(CGFloat))wr_headerHeight{
    return ^id(CGFloat height){
        self.sectionHeaderHeight = height;
        return self;
    };
}

- (UIlistSectionWrapper *(^)(CGFloat))wr_footerHeight{
    return ^id(CGFloat height){
        self.sectionFooterHeight = height;
        return self;
    };
}

- (UIlistSectionWrapper *(^)(NSInteger))wr_sectionType{
    return ^id(NSInteger type){
        self.sectionType = type;
        return self;
    };
}

#pragma mark - UIlistSectionProtocol
- (NSUInteger)count{
    return self.rowDatas.count;
}

- (NSUInteger)rowCount{
    return [self count];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx{
    return self.rowDatas[idx];
}

- (void)dealloc{
    NSLog(@"%s/%@",__func__,self);
}

@end
