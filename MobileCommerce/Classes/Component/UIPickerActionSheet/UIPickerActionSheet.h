//
//  UIPickerActionSheet.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-26.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIPickerActionSheet : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (strong, nonatomic) UIActionSheet *sheet;
@property (strong, nonatomic) UIPickerView * picker;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) id selectedItem;

@end
