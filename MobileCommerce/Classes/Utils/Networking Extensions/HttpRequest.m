//
//  HttpRequest.m
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-12.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "HttpRequest.h"
#import "HttpResponse.h"
#import "AppDotComAPIClient.h"

@implementation HttpRequest


+ (void)getDataWithParamters:(NSDictionary *)paramters URL:(NSString *)url
                      Block:(void (^)(id res, NSError * error))block
{
//    NSLog(@"uri %@", url);
    if ([[UserCenter sharedUserCenter] isLogin]) {
        [[UserCenter sharedUserCenter] loadCookies];
    }
    [[AppDotComAPIClient sharedClinet] GET:url parameters:paramters success:^(NSURLSessionDataTask *task, id JSON) {
        NSLog(@"get res %@", JSON);
        HttpResponse * res = [[HttpResponse alloc] init];
        [res processObj:JSON];
        if (block) {
            if(res.error) {
                block(nil, res.error);
            } else {
                block(res.dict, nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil, error);
//            NSLog(@"get error %@", error);
        }
    }];
}

+ (void)postDataWithParamters:(NSDictionary *)paramter URL:(NSString *)url
                        Block:(void (^)(id res, NSError * error))block
{
    
//    NSLog(@"net type=%d", [[[AppDotComAPIClient sharedClinet] reachabilityManager] networkReachabilityStatus]);
    
    if([[UserCenter sharedUserCenter] isLogin]) {
        [[UserCenter sharedUserCenter] loadCookies];
    }
    
    [[AppDotComAPIClient sharedClinet] POST:url parameters:paramter success:^(NSURLSessionDataTask *task, id JSON) {
        HttpResponse * res = [[HttpResponse alloc] init];
        
        DLOG(@"%@", task.response);
        [res processObj:JSON];
        if (block) {
            if (res.error) {
                block(nil, res.error);
            } else {
                block(res.dict, nil);
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];

}

@end
