//
//  UITableCellStyleIndicator.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/5.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import "UITableCellStyleIndicator.h"

@implementation UITableCellStyleIndicator

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

/*
- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType{
    if (accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        //cell indicator 设置
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table_cell_indicator"]];
    }else{
        [super setAccessoryType:accessoryType];
    }
}
*/

@end
