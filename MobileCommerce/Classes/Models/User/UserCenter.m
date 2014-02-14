//
//  UserCenter.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "UserCenter.h"
#import "SSKeychain.h"
#import "HttpRequest.h"
#import "User.h"

@implementation UserCenter
@synthesize error = _error;
//@synthesize session = _session;
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

- (NSString *)username
{
    return [SSKeychain passwordForService:kAppleID account:@"username"];
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

- (void)signUpWithUsername:(NSString *)username Passwd:(NSString *)passwd Phone:(NSString *)phone
{
    NSMutableDictionary * paramters = [NSMutableDictionary dictionaryWithCapacity:2];
    [paramters setValue:username forKey:@"username"];
    [paramters setValue:passwd forKey:@"password"];
    [paramters setValue:phone forKey:@"mobile"];
//    NSLog(@"%@", paramters);
    [HttpRequest postDataWithParamters:paramters URL:@"signup" Block:^(id res, NSError *error) {
        if (error) {
//            NSLog(@"%@", error);
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        } else {
            
        }
    }];
}

- (void)signInWithUsername:(NSString *)username Passwd:(NSString *)passwd
{
    DLOG(@"login login");
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isSigningIn"];
    _error = nil;
    NSMutableDictionary * paramters = [NSMutableDictionary dictionaryWithCapacity:2];
    [paramters setValue:username forKey:@"username"];
    [paramters setValue:passwd forKey:@"password"];
    
    [HttpRequest postDataWithParamters:paramters URL:@"signin" Block:^(id res, NSError *error) {
        if (error) {
            _error = error;
            NSLog(@"ERROR: %@", error.localizedDescription);
        } else {
            NSLog(@"%@", res);
            _user = [[User alloc] initWithAttributes:res];
            [self save];
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isSigningIn"];
    }];
    
}

- (void)signout
{
    [SSKeychain deletePasswordForService:kAppleID account:@"username"];
    [SSKeychain deletePasswordForService:kAppleID  account:@"auth"];
    
    [HttpRequest postDataWithParamters:nil URL:@"signout" Block:^(id res, NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        } else {

        }
    }];
}

- (void)save
{
    NSLog(@"username %@", _user.username);
    [SSKeychain setPassword:_user.username forService:kAppleID account:@"username"];
    [SSKeychain setPassword:[NSString stringWithFormat:@"%d", _user.auth]forService:kAppleID account:@"auth"];
}

- (BOOL)isSeller
{
    return NO;
}

- (BOOL)isLogin
{
    if ([SSKeychain passwordForService:kAppleID account:@"auth"])
        return YES;
    return NO;
}

@end
