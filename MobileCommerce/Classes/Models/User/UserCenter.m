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
@synthesize user = _user;

DEFINE_SINGLETON_FOR_CLASS(UserCenter);

- (id)init
{
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isSigningIn"];
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isSigningUp"];
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isSigningOut"];
    }
    
    return self;
}

- (void)siginup
{

}

- (void)signin
{

}

- (void)signout
{

}

- (void)save
{

}

@end
