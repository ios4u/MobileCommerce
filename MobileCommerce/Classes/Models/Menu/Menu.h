//
//  Menu.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Menu : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * klass;

- (id)initWithAttributes:(NSDictionary *)attributes;
@end
