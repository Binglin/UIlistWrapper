//
//  HorizontalScrollTableViewCellViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/10/7.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "HorizontalScrollTableViewCellViewController.h"
#import "HorizontalScrollTableViewCell.h"

@interface HorizontalScrollTableViewCellViewController ()

@end

@implementation HorizontalScrollTableViewCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataManager.dataSources = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""].mutableCopy;
    self.tableView.rowHeight = [HorizontalScrollTableViewCell fixCellHeight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerCells{
    [self.tableView registerCellClass:[HorizontalScrollTableViewCell class]];
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath{
    return @"HorizontalScrollTableViewCell";
}

- (void)configurationCell:(HorizontalScrollTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"");
    cell.dataManager.dataSources = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""].mutableCopy;
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
