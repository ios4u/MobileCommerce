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
}

@property (strong, nonatomic) User * user;


DEFINE_SINGLETON_FOR_HEADER(UserCenter);

- (void)siginup;
- (void)signin;
- (void)signout;

@end
