//
//  CollectionViewController.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/14.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "CollectionViewController.h"

@implementation CollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.dataManager addObject:@"1"];
    [self.dataManager addObjectsFromArray:@[@"2",@"3",@"4",@"5"]];
}

- (void)configurationCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor redColor];
}

@end
