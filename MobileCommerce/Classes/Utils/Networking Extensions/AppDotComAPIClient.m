//
//  AppDotComAPIClient.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-12-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "AppDotComAPIClient.h"


@implementation AppDotComAPIClient


+ (instancetype)sharedClinet
{
    static AppDotComAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AppDotComAPIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBase]];
    });
    
    return _sharedClient;
}

@end
