//
//  UITableCellStyleSystem.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/5.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import "UITableCellStyleSystem.h"
#import "UIlistCellWrapper.h"

@implementation UITableCellStyleSystem

- (void)setItem:(UIlistCellWrapper *)item{
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.detailText;
    self.imageView.image = [UIImage imageNamed:item.imageName];
    if (self.accessoryType != item.accessoryType) {
        self.accessoryType = item.accessoryType;
    }
}

@end
