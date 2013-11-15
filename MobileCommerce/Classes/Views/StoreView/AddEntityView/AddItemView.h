//
//  AddItemView.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCImageView.h"


@protocol AddItemViewDelegate <NSObject>

- (void)openPickerImager:(id)sender;

@end

@interface AddItemView : UIView <MCImageViewDelegate>

@property (weak, nonatomic) id <AddItemViewDelegate> delegate;
@property (strong, nonatomic) MCImageView * itemImageV;
@property (strong, nonatomic) UILabel * itemNameL;
@property (strong, nonatomic) UITextField * itemNameTF;

@property (strong, nonatomic) UILabel * priceL;
@property (strong, nonatomic) UITextField * priceTF;

@end
