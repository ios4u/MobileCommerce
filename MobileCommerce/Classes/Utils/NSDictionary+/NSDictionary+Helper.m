//
//  NSDictionary+Helper.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-12.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "NSDictionary+Helper.h"
#import "JSONKit.h"

@implementation NSDictionary (Helper)

+ (NSDictionary *)JsonObjFromData:(NSData *)data
{
    NSString * json_str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", json_str);
    //    CLOG(@"%@", );
    return [json_str objectFromJSONString];
}

@end
