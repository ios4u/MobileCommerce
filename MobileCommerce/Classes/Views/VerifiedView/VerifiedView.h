//
//  VerifiedView.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-27.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VerifiedViewDelegate <NSObject>

@optional
- (void)TapSendSMSWithPhone:(NSString *)phone;
- (void)TapCodeVerifiedWithCode:(NSString *)code;

@end

@interface VerifiedView : UIView

@property (weak, nonatomic) id <VerifiedViewDelegate> delegate;

@property (strong, nonatomic) NSString * mobile;
@property (strong, nonatomic) UILabel * phoneL;
@property (strong, nonatomic) UIButton * sendSMSBtn;
@property (strong, nonatomic) UITextField * codeTF;
@property (strong, nonatomic) UIButton * verfiedBtn;

@end
