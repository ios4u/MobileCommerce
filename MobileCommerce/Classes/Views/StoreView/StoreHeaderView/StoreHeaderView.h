//
//  StoreHeaderView.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

@protocol StoreHeaderViewDelegate <NSObject>

- (void)TapAddressBtn:(NSString *)address;
- (void)TapPhoneBtn:(NSString *)phone;

@end

@interface StoreHeaderView : UIView

//@property (strong, nonatomic)
@property (weak, nonatomic) id <StoreHeaderViewDelegate> delegate;
@property (strong, nonatomic) Store * store;
@property (strong, nonatomic) UIImageView * storeImageView;
@property (strong, nonatomic) UILabel * storeNameL;
@property (strong, nonatomic) UIButton * storeAddressBtn;
@property (strong, nonatomic) UIButton * storePhoneBtn;

@end
