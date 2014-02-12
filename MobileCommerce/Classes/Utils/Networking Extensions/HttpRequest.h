//
//  HttpRequest.h
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-12.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

+ (void)getDataWithParamters:(NSDictionary *)paramters URL:(NSString *)url
                      Block:(void (^)(id res, NSError * error))block;

+ (void)postDataWithParamters:(NSDictionary *)paramter URL:(NSString *)url
                        Block:(void (^)(id res, NSError * error))block;
@end
