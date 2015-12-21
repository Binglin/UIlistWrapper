//
//  UIlistEmptyView.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/12/21.
//  Copyright © 2015年 BL. All rights reserved.
//

#import "UIlistEmptyView.h"


@implementation UIlistEmptyModel

@end








@interface UIlistEmptyView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *descriptionLabel;
@property (nonatomic, strong) UIButton    *actionButton;

@end

@implementation UIlistEmptyView

- (instancetype)initWithFrame:(CGRect)frame entity:(UIlistEmptyModel *)emptyEntity{
    if (self = [super initWithFrame:frame]) {
        if (emptyEntity.viewType == SpecialViewType_Empty_Logo) {
            self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:emptyEntity.iconName]];
            [self addSubview:_imageView];
        }
        
    }
    return self;
}


#pragma mark - getter & setter
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)descriptionLabel{
    if (_descriptionLabel == nil) {
        _descriptionLabel = [UILabel new];
        [self addSubview:_descriptionLabel];
    }
    return _descriptionLabel;
}

- (UIButton *)actionButton{
    if (_actionButton == nil) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_actionButton];
    }
    return _actionButton;
}

@end
