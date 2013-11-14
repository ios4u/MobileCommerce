//
//  LoginView.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 13-11-13.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate <NSObject>

- (void)TapSignInWithUsername:(NSString *)username Passwd:(NSString *)passwd;
- (void)TapSignUp;

@end

@interface LoginView : UIView <UITextFieldDelegate>

@property (weak, nonatomic) id<LoginViewDelegate> delegate;

@property (strong, nonatomic) UILabel * usernameL;
@property (strong, nonatomic) UILabel * passwdL;
@property (strong, nonatomic) UITextField * usernameTF;
@property (strong, nonatomic) UITextField * passwdTF;

@property (strong, nonatomic) UIButton * signInBtn;
@property (strong, nonatomic) UIButton * signUpBtn;

- (void)hidenkeyboard;
@end
