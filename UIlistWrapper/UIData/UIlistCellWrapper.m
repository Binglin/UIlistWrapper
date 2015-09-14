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
    return [[UIlistCellWrapper alloc] init];
}

- (instancetype)configuration:(CellConfiguration)cellConfiguration{
    if (cellConfiguration) {
        cellConfiguration(self);
    }
    return self;
}

- (UIlistCellWrapper *(^)(NSString *))wr_title{
    return ^id(NSString *sTitle){
        self.title = sTitle;
        return self;
    };
}

- (UIlistCellWrapper *(^)(NSString *))wr_detail{
    return ^id(NSString *sDetail){
        self.detailText = sDetail;
        return self;
    };
}

-(UIlistCellWrapper *(^)(NSString *))wr_imageName{
    return ^id(NSString *sImageName){
        self.imageName = sImageName;
        return self;
    };
}

- (UIlistCellWrapper *(^)(CGFloat))wr_cellHeight{
    return ^id(CGFloat cellHeight){
        self.cellHeight = cellHeight;
        return self;
    };
}

- (UIlistCellWrapper *(^)(CellConfiguration))wr_cellConfiguration{
    return ^id(CellConfiguration configuration){
        self.cellConfiguration = configuration;
        return self;
    };
}

- (UIlistCellWrapper *(^)(dispatch_block_t))wr_select_block_t{
    return ^id(dispatch_block_t block){
        self.select_block_t = block;
        return self;
    };
}


- (void)dealloc{
    NSLog(@"%s-%@",__func__,self);
}

@end


