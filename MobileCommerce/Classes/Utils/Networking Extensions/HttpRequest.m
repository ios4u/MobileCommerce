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
//    [[AppDotComAPIClient sharedAppDotComAPIClient] getPath:url parameters:paramters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (block) {
//            block(nil, error);
//        }
//    }];
}

+ (void)postDataWithParamters:(NSDictionary *)paramter URL:(NSString *)url
                        Block:(void (^)(id res, NSError * error))block
{
    
    NSLog(@"net type=%d", [[[AppDotComAPIClient sharedClinet] reachabilityManager] networkReachabilityStatus]);
    
    [[AppDotComAPIClient sharedClinet] POST:url parameters:paramter success:^(NSURLSessionDataTask *task, id JSON) {
//        NSHTTPCookieStorage *cookiestorage = [ NSHTTPCookieStorage sharedHTTPCookieStorage ];
        
//        NSArray *cookies=[ cookiestorage cookies ];
//        NSLog(@"cookies %@", cookies);
        HttpResponse * res = [[HttpResponse alloc] init];
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
