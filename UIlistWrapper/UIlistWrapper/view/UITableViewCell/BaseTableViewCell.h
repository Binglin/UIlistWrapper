//
//  BaseTableViewCell.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/5.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCell+setItem.h"

@interface BaseTableViewCell : UITableViewCell<UIlistItemProtocal>

- (void)setUpViews;

@end
