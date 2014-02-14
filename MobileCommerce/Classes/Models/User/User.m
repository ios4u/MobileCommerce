//
//  User.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize user_id = _user_id;
@synthesize auth = _auth;
@synthesize username = _username;
@synthesize mobile = _mobile;
@synthesize emial = _emial;
//@synthesize store_id = _store_id;
@synthesize isSeller = _isSeller;

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        _user_id = [[attributes valueForKeyPath:@"id"] integerValue];
        _auth = [[attributes valueForKeyPath:@"auth"] integerValue];
        _username = [attributes valueForKeyPath:@"username"];
        _mobile = [attributes valueForKeyPath:@"mobile"];
        _emial = [attributes valueForKeyPath:@"email"];
        _isSeller = [[attributes valueForKeyPath:@"isSeller"] boolValue];
    }
    
    return self;
}



@end
