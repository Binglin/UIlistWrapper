//
//  WRCollectionViewController.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/1.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRlistWrapperDelegate.h"

@interface WRCollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,WRlistWrapperDelegate,WRlistWrapperDataSource>

@property (nonatomic, readonly, strong) UICollectionView *collectionView;

@end
