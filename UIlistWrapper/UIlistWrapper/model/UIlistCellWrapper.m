//
//  UIlistCellWrapper.m
//  BLExampleWorkspace
//
//  Created by 郑林琴 on 15/7/1.
//  Copyright (c) 2015年 Binglin. All rights reserved.
//

#import "UIlistCellWrapper.h"

CGFloat const default_cell_height = -1;

@implementation UIlistCellWrapper

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

+ (instancetype)wrapper{
    return [[[self class] alloc] init];
}

+ (instancetype)wr_make:(WrapperConfiguration)wrapperConfiguration{
    UIlistCellWrapper *wrapper = [self wrapper];
    if (wrapperConfiguration) {
        wrapperConfiguration(wrapper);
    }
    return wrapper;
}

+ (instancetype)wrapperWithTitle:(NSString *)title{
    UIlistCellWrapper *wrapper = [self wrapper];
    wrapper.title = title;
    return wrapper;
}

- (instancetype)configurationCell:(CellConfiguration)cellConfiguration{
    self.cellConfiguration = cellConfiguration;
    return self;
}

- (UIlistCellWrapper *(^)(NSString *))wr_title{
    return ^UIlistCellWrapper *(NSString *sTitle){
        self.title = sTitle;
        return self;
    };
}

- (UIlistCellWrapper *(^)(NSString *))wr_detail{
    return ^id (NSString *sDetail){
        self.detailText = sDetail;
        return self;
    };
}

-(UIlistCellWrapper *(^)(NSString *))wr_imageName{
    return ^UIlistCellWrapper *(NSString *sImageName){
        self.imageName = sImageName;
        return self;
    };
}

- (UIlistCellWrapper *(^)(CGFloat))wr_cellHeight{
    return ^UIlistCellWrapper *(CGFloat cellHeight){
        self.cellHeight = cellHeight;
        return self;
    };
}

- (UIlistCellWrapper * (^)(Class   className))wr_cellClass{
    return ^UIlistCellWrapper * (Class className){
        self.cellClass = className;
        return self;
    };
}

- (UIlistCellWrapper *(^)(CellConfiguration))wr_cellConfiguration{
    return ^UIlistCellWrapper *(CellConfiguration configuration){
        self.cellConfiguration = configuration;
        return self;
    };
}

- (UIlistCellWrapper *(^)(dispatch_block_t))wr_select_block_t{
    return ^UIlistCellWrapper *(dispatch_block_t block){
        self.select_block_t = block;
        return self;
    };
}

- (UIlistCellWrapper *(^)(UKCellIndexBlock))wr_selectIndexPath_block{
    return ^UIlistCellWrapper * (UKCellIndexBlock block){
        self.selectIndexPath_block = [block copy];
        return self;
    };
}

- (void)dealloc{
    NSLog(@"%s-%@",__func__,self);
}

@end


