//
//  Entity.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject

@property (readonly) NSUInteger entity_id;
@property (readonly) NSUInteger store_id;
@property (unsafe_unretained, nonatomic) NSURL * image_url;
@property (readonly, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * desc;
@property (strong, nonatomic) NSString * store_name;
@property (readwrite) float price;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
