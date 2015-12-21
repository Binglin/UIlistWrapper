//
//  PullPushListViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/12/21.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "PullPushListViewController.h"
#import "UIlistPullPushManager.h"

@interface PullPushListViewController ()<UIlistEmptyViewProtocol, UIlistDataPullPushProtocol>

@property (nonatomic, strong) UIlistPullPushManager *dataManager;

@end


@implementation PullPushListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataManager = [UIlistPullPushManager managerWithMaker:^(UIlistPullPushMaker *maker) {
        maker.scrollView    = self.tableView;
        maker.couldLoadMore = YES;
        maker.couldRefresh  = YES;
        maker.emptyDelegate = self;
        maker.delegate      = self;
        maker.pageCount     = 5;
    }];
    
    [self.dataManager refreshView];
    [self.dataManager appendData:@[@"1",@"2",@"3",@"4",@"5"] withMore:YES];
}

- (void)configurationCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = @"123";
}

#pragma mark - UIlistEmptyViewProtocol
- (void)listManager:(UIlistPullPushManager *)manager showEmpty:(BOOL)show{
    
}

#pragma mark - UIlistDataPullPushProtocol
- (void)loadMore:(BOOL)more{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.dataManager appendData:@[@"1",@"2",@"3",@"4",@"5"]];
        [self.dataManager reload];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
