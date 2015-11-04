//
//  WRTableViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/1.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import "WRTableViewController.h"
#import "UITableViewCell+setItem.h"





#pragma mark - tableView

@implementation UITableView (registerCell)

/**
 *  default cell identifier is NSStringFromClass(cellClass)
 */
- (void)registerCellClass:(Class)cellClass{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerCellNib:(Class)cellClass{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerLazyClass:(Class)cellClass{
    NSString *nibPath = [[NSBundle mainBundle] pathForResource:NSStringFromClass(cellClass) ofType:@"nib"];
    
    if (nibPath) {
        [self registerCellNib:cellClass];
    }else{
        [self registerCellClass:cellClass];
    }
}

@end






@interface WRTableViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation WRTableViewController
@synthesize dataManager;

- (void)loadView{
    [super loadView];
    [self setUpTableView];
    [self registerCells];
    self.dataManager = [UIlistDataManager new];
}

- (void)setUpTableView{
    
    //没有tableview
    if (self.tableView == nil) {
        
        //但是xib或者storyboard中有tableView 但是没有和self.tableView进行关联的情况下
        [self.view.subviews enumerateObjectsUsingBlock:^(UIView *  obj, NSUInteger idx, BOOL * stop) {
            if ([obj isKindOfClass:[UITableView class]]) {
                UITableView *table = (UITableView *)obj;
                self.tableView = table;
                *stop = YES;
            }
        }];
        
        //xib或者storyboard中没有tableView
        self.tableView = [[UITableView alloc] initWithFrame:[self listFrame] style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (self.tableView.delegate == nil) {
        self.tableView.delegate = self;
    }
    if (self.tableView.dataSource == nil) {
        self.tableView.dataSource = self;
    }
}

#pragma mark - DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataManager rowCountInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.dataManager sectionCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self identifierAtIndexPath:indexPath]];
    [cell setItem:[self.dataManager dataAtIndexPath:indexPath]];
    [self configurationCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configurationCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{

}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath{
    return @"UITableViewCell";
}

- (CGRect)listFrame{
    return CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (void)registerCells{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.tableView.frame = [self listFrame];
}


@end
