//
//  UIlistEmptyView.h
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/12/21.
//  Copyright © 2015年 BL. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum:NSUInteger{
    SpecialViewType_loading = 10330,
    
    SpecialViewType_Empty,
    SpecialViewType_Empty_Logo ,//image
    SpecialViewType_Empty_Label,
    SpecialViewType_Empty_Button,
    
    SpecialViewType_Error,
    SpecialViewType_Error_Label,
    
} UIlistSpecialViewType;



@interface UIlistEmptyModel : NSObject

@property (nonatomic, copy  ) NSString        *title;
@property (nonatomic, copy  ) NSString        *iconName;
@property (nonatomic, assign) UIlistSpecialViewType viewType;

@end



@interface UIlistEmptyView : UIView

- (instancetype)initWithFrame:(CGRect)frame entity:(UIlistEmptyModel *)emptyEntity;

@end
