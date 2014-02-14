//
//  HttpResponse.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-14.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpResponse : NSObject

@property (strong, nonatomic) NSDictionary * dict;
@property (strong, nonatomic) NSError * error;


- (void)processObj:(id)obj;

@end
