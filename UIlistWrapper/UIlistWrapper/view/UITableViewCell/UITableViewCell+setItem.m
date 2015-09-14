//
//  UITableViewCell+setItem.m
//  UIlistWrapper
//
//  Created by 郑林琴 on 15/9/5.
//  Copyright (c) 2015年 BL. All rights reserved.
//

#import "UITableViewCell+setItem.h"
#import <objc/runtime.h>

@implementation UITableViewCell (setItem)

#pragma mark - swizzle
+ (void)load{
    Method originAwakeMethod = class_getInstanceMethod([self class], @selector(initWithStyle:reuseIdentifier:));
    Method swizzAwakeMethod  = class_getInstanceMethod([self class], @selector(initWithWRStyle:reuseIdentifier:));
    method_exchangeImplementations(originAwakeMethod, swizzAwakeMethod);
    
    
    Method originInitCoder = class_getInstanceMethod(self, @selector(initWithCoder:));
    Method swizzInitCoder  = class_getInstanceMethod(self, @selector(initWithWRCoder:));
    method_exchangeImplementations(originInitCoder, swizzInitCoder);
}

- (instancetype)initWithWRStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [self initWithWRStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithWRCoder:(NSCoder *)aDecoder{
    if (self = [self initWithWRCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}


#pragma mark - initialize subview
- (void)customAwakeFromNib{
    [self initialize];
}

- (void)setUpViews{
    
}

- (void)initialize{
    self.backgroundColor = [UIColor redColor];
    [self setUpViews];
}

#pragma setData
- (void)setItem:(id)item{
    
}


@end
