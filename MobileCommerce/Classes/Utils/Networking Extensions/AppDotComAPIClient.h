//
//  AppDotComAPIClient.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-12-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface AppDotComAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClinet;

@end
