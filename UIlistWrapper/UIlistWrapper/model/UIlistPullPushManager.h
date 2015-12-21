//
//  UIlistPullPushManager.h
//  UIlistWrapper
//
//  Created by ET|冰琳 on 15/11/3.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "UIlistDataManager.h"

@class UIlistPullPushManager;

@protocol UIlistViewControllerProtocol <NSObject>

@optional
- (UIScrollView *)scrollView;

@end


@protocol UIlistDataPullPushProtocol <NSObject>

@required
- (void)loadMore:(BOOL)more;

@end

@protocol UIlistEmptyViewProtocol <NSObject>

- (void)listManager:(UIlistPullPushManager *)manager showEmpty:(BOOL)show;

@optional


@end


#pragma mark - 

@interface UIlistPullPushMaker : NSObject

@property (nonatomic, assign) UIScrollView * scrollView;

@property (nonatomic, assign) BOOL  couldRefresh; //DEFAULT YES
@property (nonatomic, assign) BOOL  couldLoadMore;//DEFAULT NO
@property (nonatomic, assign) BOOL  scrollToTopWhenRefresh;

@property (nonatomic, assign) int   pageIndex;//default start is 1~server start is 1
@property (nonatomic, assign) int   pageCount;//default 10

@property (nonatomic, assign) id<UIlistEmptyViewProtocol>     emptyDelegate;
@property (nonatomic, assign) id<UIlistDataPullPushProtocol>  delegate;

@end


#pragma mark -
@interface UIlistPullPushManager : UIlistDataManager

+ (instancetype)managerWithMaker:(void(^)(UIlistPullPushMaker *maker))block;

+ (instancetype)managerWithPullOflistView:(UIScrollView *)scrollView
                           ListController:(id<UIlistDataPullPushProtocol>)controller;

+ (instancetype)managerWithPullPushOflistView:(UIScrollView *)scrollView
                               ListController:(id<UIlistDataPullPushProtocol>)controller;


+ (instancetype)managerWithPullPushWithlistView:(UIScrollView *)scrollView
                                  withPageCount:(int)pageCount
                                  ListController:(id<UIlistDataPullPushProtocol>)controller;

+ (instancetype)managerWithPullOfTableView:(UIScrollView *)tableView  loadData:(void(^)(BOOL more))loadData;
+ (instancetype)managerWithPullPushOfTableView:(UIScrollView *)tableView loadData:(void(^)(BOOL more))loadData;


@property (nonatomic, assign) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL couldRefresh;
@property (nonatomic, assign) BOOL couldLoadMore;


/*数据请求状态*/
@property (readonly , assign) BOOL  isLoadMore;
/*是否已经加载过数据*/
@property (nonatomic, assign) BOOL  hasLoadData;

/*刷新数据是否回到顶部*/
@property (nonatomic, assign) BOOL scrollToTopWhenRefresh;



#pragma mark - 分页
/**
 * 返回需要请求的pageIndex  @param more YES表示加载更多 NO表示刷新
 */
- (int )pageIndexToRequestWithMore:(BOOL)more;

@property (nonatomic, assign) int pageIndex;//start is 1~server start is 1
@property (nonatomic, assign) int pageCount;//default 10
@property (nonatomic, assign) BOOL  hasMore;//count in -> appendData


#pragma mark - 数据
/***  判断数据是否为空*/
- (BOOL)isEmpty;

@property (nonatomic, assign) id<UIlistEmptyViewProtocol>  emptyDelegate;

- (void)hideLoadMore:(BOOL)hide;



#pragma mark - 添加数据
/*** @param more  YES添加 NO删除所有再add数据*/
/** add数据 && 结束刷新*/
- (void)appendData:(NSArray *)datas reloadTableWithMore:(BOOL)more;
- (void)appendData:(NSArray *)datas;

/*UITableView or collectionView reloadData*/
- (void)reload;



#pragma mark - 刷新
/*** 手动刷新 */
- (void)beginRefreshing;

/***  结束刷新或者请求更多*/
- (void)endRefreshing;
- (void)endRefreshingWithMoreData:(BOOL)more;


@end
