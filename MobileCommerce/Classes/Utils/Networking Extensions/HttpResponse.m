//
//  HttpResponse.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-14.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "HttpResponse.h"

@implementation HttpResponse

@synthesize dict = _dict;
@synthesize error = _error;

- (instancetype)init
{
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (void)processObj:(id)obj
{
//    NSLog(@"json %@", obj);
    NSInteger rt = [[obj valueForKeyPath:@"rt"] integerValue];
    
    switch (rt) {
        case 0:
//            _error
            break;
            
        default:
            _dict = [obj valueForKeyPath:@"data"];
            break;
    }
}

@end
