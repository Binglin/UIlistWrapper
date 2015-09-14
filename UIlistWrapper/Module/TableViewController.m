//
//  TableViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/14.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "TableViewController.h"
#import "NibTableViewCell.h"
#import "UIlistCellWrapper.h"
#import "UIlistSectionWrapper.h"

@implementation TableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.isMultiSection = YES;
    [self.dataSources addObject:[UIlistSectionWrapper wrapperWithRowDatas:@[@"1"]]];
    [self.dataSources addObject:[UIlistSectionWrapper wrapperWithRowDatas:@[@"2",@"3",@"4",@"5"]]];
}

- (void)registerCells{
    [self.tableView registerCellNib:[NibTableViewCell class]];
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath{
    return @"NibTableViewCell";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}


@end
