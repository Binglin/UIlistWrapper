//
//  NibTableViewCell.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/13.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import "NibTableViewCell.h"

@implementation NibTableViewCell

- (void)setItem:(id)item{
    self.textLabel.text = item;
}
@end
