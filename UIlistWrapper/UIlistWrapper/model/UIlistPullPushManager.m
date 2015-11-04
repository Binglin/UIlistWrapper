//
//  UIlistPullPushManager.m
//  UIlistWrapper
//
//  Created by ET|冰琳 on 15/11/3.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "UIlistPullPushManager.h"
#import "MJRefresh.h"

typedef void(^UIlistRefreshBlock)(BOOL more);

@interface UIlistPullPushManager ()

@property (nonatomic, copy) UIlistRefreshBlock pullPushBlock;
@property (nonatomic, assign) id<UIlistViewControllerProtocol, UIlistDataPullPushProtocol> delegate;

@end

@implementation UIlistPullPushManager

+ (instancetype)managerWith:(void (^)(UIlistPullPushManager *))configuration{
    UIlistPullPushManager *pullpushManager = [UIlistPullPushManager new];
    if (configuration) {
        configuration(pullpushManager);
    }
    return pullpushManager;
}

#pragma mark - initialize
+ (instancetype)managerWithPullListController:(id<UIlistViewControllerProtocol,UIlistDataPullPushProtocol>)controller{
    if (controller.scrollView == nil) {
        NSAssert(controller.scrollView, @"UITableView UICollectionView 还没有初始化呀");
    }
    UIlistPullPushManager *pullpushManager = [UIlistPullPushManager new];
    pullpushManager.scrollView = controller.scrollView;
    pullpushManager.couldRefresh  = YES;
    pullpushManager.delegate = controller;
    return pullpushManager;
}

+ (instancetype)managerWithPullPushListController:(id<UIlistViewControllerProtocol,UIlistDataPullPushProtocol>)controller{
    if (controller.scrollView == nil) {
        NSAssert(controller.scrollView, @"UITableView UICollectionView 还没有初始化呀");
    }
    UIlistPullPushManager *pullpushManager = [UIlistPullPushManager new];
    pullpushManager.scrollView = controller.scrollView;
    pullpushManager.couldRefresh  = YES;
    pullpushManager.couldLoadMore = YES;
    pullpushManager.delegate = controller;
    return pullpushManager;
}

+ (instancetype)managerWithPullPushWithPageCount:(NSInteger)pageCount ListController:(id<UIlistViewControllerProtocol,UIlistDataPullPushProtocol>)controller{
    if (controller.scrollView == nil) {
        NSAssert(controller.scrollView, @"UITableView UICollectionView 还没有初始化呀");
    }
    UIlistPullPushManager *pullpushManager = [UIlistPullPushManager new];
    pullpushManager.scrollView = controller.scrollView;
    pullpushManager.pageCount  = pageCount;
    pullpushManager.couldRefresh  = YES;
    pullpushManager.couldLoadMore = YES;
    pullpushManager.delegate = controller;
    return pullpushManager;
}


+ (instancetype)managerWithPullListController:(id<UIlistViewControllerProtocol>)controller loadData:(void(^)(BOOL more))loadData{
    if (controller.scrollView == nil) {
        NSAssert(controller.scrollView, @"UITableView UICollectionView 还没有初始化呀");
    }
    UIlistPullPushManager *pullpushManager = [UIlistPullPushManager new];
    pullpushManager.scrollView = controller.scrollView;
    pullpushManager.couldRefresh  = YES;
    pullpushManager.pullPushBlock = loadData;
    return pullpushManager;
}

+ (instancetype)managerWithPullPushListController:(id<UIlistViewControllerProtocol>)controller loadData:(void (^)(BOOL))loadData{
    if (controller.scrollView == nil) {
        NSAssert(controller.scrollView, @"UITableView UICollectionView 还没有初始化呀");
    }
    UIlistPullPushManager *pullpushManager = [UIlistPullPushManager new];
    pullpushManager.scrollView = controller.scrollView;
    pullpushManager.couldRefresh  = YES;
    pullpushManager.couldLoadMore = YES;
    pullpushManager.pullPushBlock = loadData;
    return pullpushManager;
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
    if ((more == NO) || (self.pageIndex == 0)) {
        return 1;
    }
    //request more index
    return self.pageIndex + 1;
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
    normalHeader.lastUpdatedTimeLabel.textColor = [UIColor blackContentColor];
    normalHeader.stateLabel.textColor = [UIColor blackContentColor];
    self.scrollView.header = normalHeader;
    [normalHeader beginRefreshing];
}

- (void)addRefreshFooterView{
    @weakify(self);
    MJRefreshBackNormalFooter *normalFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self loadMore:YES];
    }];
    normalFooter.stateLabel.textColor = [UIColor blackContentColor];
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
    self.scrollView.footer.hidden = hide;
}

- (void)loadMore:(BOOL)more{
    if (self.pullPushBlock) {
        self.pullPushBlock(more);
    }else if (self.delegate){
        [self.delegate loadMore:more];
    }
}

- (void)dealloc{
    NSLog(@"%@-%s",NSStringFromClass(self.class),__func__);
}
