//
//  User.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (readonly) NSUInteger user_id;
@property (strong, nonatomic) NSString * username;
@property (strong, nonatomic) NSString * mobile;
@property (strong, nonatomic) NSString * emial;
@property (readonly) NSUInteger store_id;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
