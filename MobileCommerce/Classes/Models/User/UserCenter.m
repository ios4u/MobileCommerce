//
//  UserCenter.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "UserCenter.h"
#import "SSKeychain.h"

@implementation UserCenter
@synthesize access_token = _access_token;
@synthesize user = _user;

DEFINE_SINGLETON_FOR_CLASS(UserCenter);

- (id)init
{
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isSigningIn"];
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isSigningUp"];
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isSignOut"];
    }
    
    return self;
}

- (void)addTheObserverWithObject:(id)obj
{
    [self addObserver:obj forKeyPath:@"isSigningIn" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:obj forKeyPath:@"isSigningUp" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:obj forKeyPath:@"isSignOut" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeTheObserverWithObject:(id)obj
{
    [self removeObserver:obj forKeyPath:@"isSigningIn"];
    [self removeObserver:obj forKeyPath:@"isSigningUp"];
    [self removeObserver:obj forKeyPath:@"isSignOut"];
}

- (void)siginup
{

}

- (void)signInWithUsername:(NSString *)username Passwd:(NSString *)passwd
{

}

- (void)signout
{

}

- (void)save
{

}

- (BOOL)isSeller
{
    return NO;
}

- (BOOL)isLogin
{
    _access_token = [SSKeychain passwordForService:@"" account:@"access_token"];
    if (_access_token) {
        return YES;
    } else {
        return NO;
    }
}

@end
