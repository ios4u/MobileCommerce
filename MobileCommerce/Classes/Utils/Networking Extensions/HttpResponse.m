//
//  HttpResponse.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-12.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "HttpResponse.h"
#import "NSDictionary+Helper.h"

@implementation HttpResponse

- (id)init
{
    self = [super init];
    if (self) {
    
    }
    
    return self;
}

- (void)processResObj:(id)obj
{
    NSDictionary * JSON = [NSDictionary JsonObjFromData:obj];
    NSLog(@"json %@", JSON);
//    CLOG(@"json %@", JSON);
}

@end
