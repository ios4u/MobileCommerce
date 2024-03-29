//
//  UserCenter.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface UserCenter : NSObject
{
    BOOL isSigningIn;
    BOOL isSigningUp;
    BOOL isSignOut;
    BOOL isSendingSMS;
    BOOL isVerifyCode;
}

@property (strong, nonatomic) NSError * error;
//@property (strong, nonatomic) NSString * session;
@property (strong, nonatomic) User * user;


DEFINE_SINGLETON_FOR_HEADER(UserCenter);

- (NSString *)username;
- (NSString *)mobile;
//- (void)siginup;
//- (void)signin;
- (void)signUpWithUsername:(NSString *)username Passwd:(NSString *)passwd Phone:(NSString *)phone;
- (void)signInWithUsername:(NSString *)username Passwd:(NSString *)passwd;
- (void)signout;
- (void)sendSMSWithPhone:(NSString *)phone;
- (void)verifyCode:(NSString *)code;

- (BOOL)isSeller;
- (BOOL)isLogin;
- (BOOL)isAuth;

- (void)loadCookies;

- (void)addTheObserverWithObject:(id)obj;
- (void)removeTheObserverWithObject:(id)obj;
@end
