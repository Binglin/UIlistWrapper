//
//  UIlistItemProtocal.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/5.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIlistItemProtocal <NSObject>

@optional
@property (nonatomic, assign) id dataItem;

@required
- (void)setItem:(id)item;

@end





@protocol UIlistWrapperProtocol <NSObject>

- (id)dataAtIndexPath:(NSIndexPath *)indexPath;
- (id)dataAtSection:(NSInteger)section;

@end
