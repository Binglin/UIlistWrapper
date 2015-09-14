//
//  WRTableViewController.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/1.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIlistCellWrapper.h"
#import "UIlistSectionWrapper.h"
#import "WRlistWrapperDelegate.h"

#pragma mark - tableView

@interface UITableView (registerCell)

/**
 *  default cell identifier is NSStringFromClass(cellClass)
 */
- (void)registerCellClass:(Class)cellClass;
- (void)registerCellNib:(Class)cellClass;
- (void)registerLazyClass:(Class)cellClass;

@end



@interface WRTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,WRlistWrapperDelegate>

@property (nonatomic, strong, readonly) UITableView    * tableView;

@end
