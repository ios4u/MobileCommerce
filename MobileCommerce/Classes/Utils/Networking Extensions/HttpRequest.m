//
//  HttpRequest.m
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-12.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "HttpRequest.h"
#import "AppDotComAPIClient.h"

@implementation HttpRequest


+ (void)getDataWithParamters:(NSDictionary *)paramters URL:(NSString *)url
                      Block:(void (^)(id res, NSError * error))block
{
    [[AppDotComAPIClient sharedAppDotComAPIClient] getPath:url parameters:paramters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)postDataWithParamters:(NSDictionary *)paramter URL:(NSString *)url
                        Block:(void (^)(id res, NSError * error))block
{
    [[AppDotComAPIClient sharedAppDotComAPIClient] postPath:url parameters:paramter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
