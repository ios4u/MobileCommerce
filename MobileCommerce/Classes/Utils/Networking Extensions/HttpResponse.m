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

@synthesize data = _data;
@synthesize rt = _rt;
@synthesize error = _error;

- (id)init
{
    self = [super init];
    if (self) {
    
    }
    
    return self;
}

- (void)processResObj:(id)obj
{
//    NSDictionary * JSON = [NSDictionary JsonObjFromData:obj];
//    NSLog(@"json %@", obj);
    _rt = [[obj valueForKeyPath:@"rt"] integerValue];
    
    switch (_rt) {
        case 0:
            
            break;
    
        default:
            _data = [obj valueForKeyPath:@"data"];
            break;
    }
//    CLOG(@"json %@", JSON);
}

@end
