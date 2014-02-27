//
//  UIPickerActionSheet.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-26.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIPickerActionSheetDelegate;


@interface UIPickerActionSheet : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) id<UIPickerActionSheetDelegate> delegate;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) UIActionSheet *sheet;
@property (strong, nonatomic) UIPickerView * picker;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) id selectedItem;

@end

@protocol UIPickerActionSheetDelegate <NSObject>
@optional
- (void)pickerActionSheet:(UIPickerActionSheet*)aPickerActionSheet didSelectItem:(id)aItem;
- (void)pickerActionSheetDidCancel:(UIPickerActionSheet*)aPickerActionSheet;
@end
