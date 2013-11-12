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
@synthesize username = _username;
@synthesize mobile = _mobile;
@synthesize emial = _emial;
@synthesize store_id = _store_id;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        _user_id = [[attributes valueForKeyPath:@"user_id"] integerValue];
        _username = [attributes valueForKeyPath:@"username"];
        _mobile = [attributes valueForKeyPath:@"mobile"];
        _emial = [attributes valueForKeyPath:@"email"];
        _store_id = [[attributes valueForKeyPath:@"store_id"] integerValue];
    }
    
    return self;
}



@end
