//
//  WRlistWrapperDelegate.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/14.
//  Copyright © 2015年 BL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WRlistWrapperDelegate <NSObject>

@property (nonatomic, strong) NSMutableArray * dataSources;
@property (nonatomic, assign) BOOL           isMultiSection;

- (void)registerCells;

- (id)dataAtIndexPath:(NSIndexPath *)indexPath;
- (void)configurationCell:(id)cell atIndexPath:(NSIndexPath *)indexPath;
- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath;
- (CGRect)listFrame;

@end
