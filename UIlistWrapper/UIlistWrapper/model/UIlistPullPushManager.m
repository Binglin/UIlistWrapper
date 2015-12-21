//
//  UIlistPullPushManager.m
//  UIlistWrapper
//
//  Created by ET|冰琳 on 15/11/3.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "UIlistPullPushManager.h"
#import "MJRefresh.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <objc/runtime.h>


typedef void(^UIlistRefreshBlock)(BOOL more);

@interface UIlistPullPushManager ()

@property (nonatomic, copy) UIlistRefreshBlock pullPushBlock;
@property (nonatomic, assign) id<UIlistViewControllerProtocol, UIlistDataPullPushProtocol> delegate;
@property (nonatomic, assign) BOOL  isLoadMore;

@end





@implementation UIlistPullPushMaker

- (instancetype)init{
    if (self = [super init]) {
        _pageIndex = 1;
        _pageCount = 10;
        _couldRefresh = YES;
    }
    return self;
}

@end

@implementation UIlistPullPushManager
@synthesize delegate;


#pragma mark - initialize

+ (instancetype)managerWithMaker:(void (^)(UIlistPullPushMaker *maker))block{
    
    UIlistPullPushManager *pullpushManager  = [UIlistPullPushManager new];
    UIlistPullPushMaker   *maker = [UIlistPullPushMaker new];
    
    if (block) {
        block(maker);
    }
    pullpushManager.scrollView              = maker.scrollView;
    pullpushManager.couldRefresh            = maker.couldRefresh;
    pullpushManager.couldLoadMore           = maker.couldLoadMore;
    pullpushManager.scrollToTopWhenRefresh  = maker.scrollToTopWhenRefresh;
    pullpushManager.pageIndex               = maker.pageIndex;
    pullpushManager.pageCount               = maker.pageCount;
    pullpushManager.emptyDelegate           = maker.emptyDelegate;
    pullpushManager.delegate                = maker.delegate;
    
    if (pullpushManager.scrollView == nil) {
        NSAssert(pullpushManager.scrollView, @"UITableView UICollectionView 还没有初始化呀");
    }
    
    return pullpushManager;
}

+ (instancetype)managerWithPullOflistView:(UIScrollView *)scrollView
                           ListController:(id<UIlistDataPullPushProtocol>)controller{
    
    return [self managerWithMaker:^(UIlistPullPushMaker *maker) {
        maker.scrollView   = scrollView;
        maker.couldRefresh = YES;
        maker.delegate     = controller;
    }];
}

+ (instancetype)managerWithPullPushOflistView:(UIScrollView *)scrollView
                               ListController:(id<UIlistDataPullPushProtocol>)controller{
    return [self managerWithMaker:^(UIlistPullPushMaker *maker) {
        maker.scrollView = scrollView;
        maker.couldRefresh = YES;
        maker.couldLoadMore = YES;
        maker.delegate      = controller;
    }];
}

+ (instancetype)managerWithPullPushWithlistView:(UIScrollView *)scrollView
                                  withPageCount:(int)pageCount
                                 ListController:(id<UIlistDataPullPushProtocol>)controller{
    
    return [self managerWithMaker:^(UIlistPullPushMaker *maker) {
        maker.scrollView = scrollView;
        maker.pageCount  = pageCount;
        maker.couldLoadMore = YES;
        maker.couldRefresh  = YES;
        maker.delegate      = controller;
    }];
}

+ (instancetype)managerWithPullOfTableView:(UITableView *)tableView  loadData:(void(^)(BOOL more))loadData{
    
    UIlistPullPushManager *manager = [self managerWithMaker:^(UIlistPullPushMaker *maker) {
        maker.scrollView = tableView;
        maker.couldRefresh = YES;
    }];
    
    manager.pullPushBlock = loadData;
    return manager;
}

+ (instancetype)managerWithPullPushOfTableView:(UITableView *)tableView loadData:(void(^)(BOOL more))loadData{
    
    UIlistPullPushManager *manager = [self managerWithMaker:^(UIlistPullPushMaker *maker) {
        maker.scrollView = tableView;
        maker.couldRefresh = YES;
        maker.couldLoadMore = YES;
    }];
    
    manager.pullPushBlock = loadData;
    return manager;
}




- (instancetype)init{
    if (self = [super init]) {
        self.pageCount   = 10;
    }
    return self;
}




/***  判断数据是否为空*/
- (BOOL)isEmpty{
    return self.dataSources.count == 0;
}


- (void)addObject:(id)object{
    [self.dataSources addObject:object];
}

- (void)addObjectsFromArray:(NSArray *)array{
    [self.dataSources addObjectsFromArray:array];
}


#pragma mark - 分页
/***  返回需要请求的pageIndex  @param more YES表示加载更多 NO表示刷新*/
- (int )pageIndexToRequestWithMore:(BOOL)more{
    if (more == NO) /*|| (self.pageIndex == 0)*/ {
        return 1;
    }
    //request more index
    return ceil((CGFloat)self.dataSources.count/(CGFloat)self.pageCount) + 1;
}


#pragma mark - pull push
- (void)setCouldRefresh:(BOOL)couldRefresh{
    if (couldRefresh) {
        [self addRefreshHeaderView];
    }
}

- (void)setCouldLoadMore:(BOOL)couldLoadMore{
    if (couldLoadMore) {
        [self addRefreshFooterView];
    }
}

- (void)addRefreshHeaderView{
    @weakify(self);
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self loadMore:NO];
    }];
    normalHeader.lastUpdatedTimeLabel.textColor = [UIColor blackColor];
    normalHeader.stateLabel.textColor = [UIColor lightGrayColor];
    self.scrollView.header = normalHeader;
    [normalHeader beginRefreshing];
}

- (void)addRefreshFooterView{
    @weakify(self);
    MJRefreshBackStateFooter *normalFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self loadMore:YES];
    }];
    [normalFooter setTitle:@"没有更多了哦" forState:MJRefreshStateNoMoreData];
    normalFooter.stateLabel.textColor = [UIColor lightGrayColor];
    self.scrollView.footer = normalFooter;
    self.scrollView.footer.hidden = YES;
}


- (void)endPullPushWithMore:(BOOL)more{
    if (more) {
        [self.scrollView.footer endRefreshing];
    }else{
        [self.scrollView.header endRefreshing];
    }
//    self.scrollView.footer.automaticallyHidden = NO;
}

- (void)hideLoadMore:(BOOL)hide{
    
    MJRefreshBackStateFooter *footer = (MJRefreshBackStateFooter *)self.scrollView.footer;

    if (hide) {
        [footer endRefreshingWithNoMoreData];
    }else{
        [footer endRefreshing];
    }
    
//    self.scrollView.footer.hidden = hide;
}

- (void)endRefreshing{
    [self endRefreshingWithMoreData:self.hasMore];
}

- (void)endRefreshingWithMoreData:(BOOL)more{
    self.hasLoadData = YES;
    if (more) {
        if (self.isLoadMore) {
            [self.scrollView.footer endRefreshing];
        }else{
            [self.scrollView.header endRefreshing];
            [self.scrollView.footer endRefreshing];
        }
    }else{
        if (self.isLoadMore) {
            if (more) {
                [self.scrollView.footer endRefreshing];
            }else{
                [self.scrollView.footer endRefreshingWithNoMoreData];
            }
        }else{
            [self.scrollView.header endRefreshing];
            if (more == NO) {
                [self.scrollView.footer endRefreshingWithNoMoreData];
            }
        }
    }
}

- (void)appendDataAndEndRefreshWithDatas:(NSArray *)datas withMore:(BOOL)more{
    [self appendData:datas];
    [self reload];
}

- (void)appendData:(NSArray *)datas reloadTableWithMore:(BOOL)more{
    [self appendData:datas];
    [self reload];
}

- (void)appendData:(NSArray *)datas{
    [self appendData:datas withMore:self.isLoadMore];
    self.hasMore = [self hasMoreWithDataCount:datas.count];
}

- (void)reload{
    if ([self.scrollView isKindOfClass:[UITableView class]]) {
        [(UITableView *)self.scrollView reloadData];
    }else if ([self.scrollView isKindOfClass:[UICollectionView class]]){
        [(UICollectionView*)self.scrollView reloadData];
    }
    [self endRefreshing];
    if (self.isLoadMore == NO && self.scrollToTopWhenRefresh) {
        self.scrollView.contentOffset = CGPointZero;
    }
    
    if (self.emptyDelegate) {
        [self.emptyDelegate listManager:self showEmpty:[self isEmpty]];
    }
}

/**
 *  @param count  a page count
 */
- (BOOL)hasMoreWithDataCount:(NSInteger)count{
    return (count == self.pageCount);
}

#pragma mark -
- (void)loadMore:(BOOL)more{
    self.isLoadMore = more;
    if (self.pullPushBlock) {
        self.pullPushBlock(more);
    }else if (self.delegate){
        [self.delegate loadMore:more];
    }
}

- (void)beginRefreshing{
    [self loadMore:NO];
}
- (void)dealloc{
    NSLog(@"%@-%s",NSStringFromClass(self.class),__func__);
}

@end


