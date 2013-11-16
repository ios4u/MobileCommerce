//
//  SignUpView.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-16.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SignUpViewDelegate <NSObject>

- (void)TapSignUpWithUsername:(NSString *)username Passwd:(NSString *)passwd Phone:(NSString *)phone;

@end

@interface SignUpView : UIView

@property (weak, nonatomic) id<SignUpViewDelegate> delegate;

@property (strong, nonatomic) UILabel * usernameL;
@property (strong, nonatomic) UITextField * usernameTF;
@property (strong, nonatomic) UILabel * passwdL;
@property (strong, nonatomic) UITextField * passwdTF;
@property (strong, nonatomic) UILabel * phoneL;
@property (strong, nonatomic) UITextField * phoneTF;

@property (strong, nonatomic) UIButton * submitBtn;


@end
