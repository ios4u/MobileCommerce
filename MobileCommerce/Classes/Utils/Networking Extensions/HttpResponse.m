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
    NSLog(@"json %@", obj);
    NSInteger rt = [[obj valueForKeyPath:RET_CODE] integerValue];
    
    switch (rt) {
        case SUCCESS:
            _dict = [obj valueForKeyPath:RET_DATA];
//        case ERROR:
            
//            _error = [NSError errorWithDomain:UserErrorDomain code:<#(NSInteger)#> userInfo:<#(NSDictionary *)#>]
            break;
            
        default:
        {
            NSString * errorMsg = [obj valueForKeyPath:@"error"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMsg forKey:NSLocalizedDescriptionKey];
            _error = [NSError errorWithDomain:UserErrorDomain code:ERROR userInfo:userInfo];
        }
            break;
    }
}

@end
