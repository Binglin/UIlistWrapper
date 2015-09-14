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
#import "WRCollectionViewController.h"
#import "CollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.dataSources addObject:[UIlistCellWrapper wr_make:^(UIlistCellWrapper *wrapper) {
        wrapper.title = @"tableView Example";
        wrapper.cellClass = [WRTableViewController class];
    }]];
    
    [self.dataSources addObject:[UIlistCellWrapper wr_make:^(UIlistCellWrapper *wrapper) {
        wrapper.title = @"collectionView Example";
        wrapper.cellClass = [CollectionViewController class];;
    }]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class class = [[self dataAtIndexPath:indexPath] cellClass];
    UIViewController *destinationVC = [[class alloc] init];
    [self.navigationController pushViewController:destinationVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
