//
//  UIlistPullPushManager.h
//  UIlistWrapper
//
//  Created by ET|冰琳 on 15/11/3.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "UIlistDataManager.h"


@protocol UIlistViewControllerProtocol <NSObject>

- (UIScrollView *)scrollView;

@end


@protocol UIlistDataPullPushProtocol <NSObject>

- (void)loadMore:(BOOL)more;

@end






@interface UIlistPullPushManager : UIlistDataManager

+ (instancetype)managerWith:(void(^)(UIlistPullPushManager *mananger))configuration;

+ (instancetype)managerWithPullListController:(id<UIlistViewControllerProtocol,UIlistDataPullPushProtocol>)controller;
+ (instancetype)managerWithPullPushListController:(id<UIlistViewControllerProtocol,UIlistDataPullPushProtocol>)controller;

+ (instancetype)managerWithPullPushWithPageCount:(NSInteger)pageCount ListController:(id<UIlistViewControllerProtocol,UIlistDataPullPushProtocol>)controller;

//+ (instancetype)managerWithPullListController:(id<UIlistViewControllerProtocol>)controller loadData:(void(^)(BOOL more))loadData;
//
//+ (instancetype)managerWithPullPushListController:(id<UIlistViewControllerProtocol>)controller loadData:(void(^)(BOOL more))loadData;


@property (nonatomic, assign) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL couldRefresh;
@property (nonatomic, assign) BOOL couldLoadMore;

//刷新数据是否回到顶部
@property (nonatomic, assign) BOOL scrollToTopWhenRefresh;

#pragma mark - 分页
/***  返回需要请求的pageIndex  @param more YES表示加载更多 NO表示刷新*/
- (int )pageIndexToRequestWithMore:(BOOL)more;
@property (nonatomic, assign) int pageIndex;//start is 1~server start is 1
@property (nonatomic, assign) int pageCount;//default 10



@property (nonatomic, assign) BOOL isEmpty;
@property (nonatomic, assign) BOOL isLoading;

/***  判断数据是否为空*/
- (BOOL)isEmpty;

- (void)endPullPushWithMore:(BOOL)more;
- (void)hideLoadMore:(BOOL)hide;

@end
