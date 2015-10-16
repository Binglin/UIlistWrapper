//
//  CollectionTableViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/10/7.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "CollectionTableViewController.h"
#import "CollectionTableViewCell.h"

@interface CollectionTableViewController ()

@end

@implementation CollectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.dataManager addObjectsFromArray:@[@"",@"",@""]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerCells{
    [self.tableView registerCellClass:[CollectionTableViewCell class]];
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath{
    return @"CollectionTableViewCell";
}

- (void)configurationCell:(CollectionTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.contentView.backgroundColor = [UIColor yellowColor];
    cell.dataManager.dataSources = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",].mutableCopy;
    [cell.collectionView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
