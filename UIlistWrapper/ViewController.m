//
//  ViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/1.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import "ViewController.h"
#import "UIlistCellWrapper.h"
#import "UIlistSectionWrapper.h"
#import "TableViewController.h"
#import "CollectionViewController.h"
#import "CollectionTableViewController.h"
#import "HorizontalScrollTableViewCellViewController.h"
#import "PullPushListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self.dataManager addObject:[UIlistCellWrapper wr_make:^(UIlistCellWrapper *wrapper) {
        wrapper.title = @"tableView Example";
        wrapper.cellClass = [TableViewController class];
    }]];
    
    [self.dataManager addObject:[UIlistCellWrapper wr_make:^(UIlistCellWrapper *wrapper) {
        wrapper.title = @"collectionView Example";
        wrapper.cellClass = [CollectionViewController class];;
    }]];
    
    [self.dataManager addObject:[UIlistCellWrapper wr_make:^(UIlistCellWrapper *wrapper) {
        wrapper.title = @"collection tableView Example";
        wrapper.cellClass = [CollectionTableViewController class];;
    }]];
    
    [self.dataManager addObject:[UIlistCellWrapper wr_make:^(UIlistCellWrapper *wrapper) {
        wrapper.title = @"horizontal scroll tableViewCell Example";
        wrapper.cellClass = [HorizontalScrollTableViewCellViewController class];;
    }]];
    
    [self.dataManager addObject:[UIlistCellWrapper wr_make:^(UIlistCellWrapper *wrapper) {
        wrapper.cellClass = [PullPushListViewController class];
    }]];
}

- (void)configurationCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = [[self.dataManager dataAtIndexPath:indexPath] title];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class class = [[self.dataManager dataAtIndexPath:indexPath] cellClass];
    UIViewController *destinationVC = [[class alloc] init];
    [self.navigationController pushViewController:destinationVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
