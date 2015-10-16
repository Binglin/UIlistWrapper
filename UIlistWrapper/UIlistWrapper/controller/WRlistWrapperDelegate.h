//
//  WRlistWrapperDelegate.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/14.
//  Copyright © 2015年 BL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIlistDataManager.h"


@protocol WRlistWrapperDataSource <NSObject>

@property (nonatomic, strong) UIlistDataManager *dataManager;

@end

@protocol WRlistWrapperDelegate <NSObject>


- (void)registerCells;
- (void)configurationCell:(id)cell atIndexPath:(NSIndexPath *)indexPath;
- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath;
- (CGRect)listFrame;

@end
