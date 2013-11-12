//
//  Store.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "Store.h"

@implementation Store
{
@private
    NSString * _image_urlString;
}

@synthesize store_id = _store_id;
@synthesize store_name = _store_name;
@synthesize address = _address;
@synthesize tel = _tel;
@synthesize desc = _desc;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        _store_id = [[attributes valueForKeyPath:@"store_id"] integerValue];
        _store_name = [attributes valueForKeyPath:@"store_name"];
        _address = [attributes valueForKeyPath:@"address"];
        _tel = [attributes valueForKeyPath:@"tel"];
        _desc = [attributes valueForKeyPath:@"desc"];
        _image_urlString = [attributes valueForKeyPath:@"image_url"];
    }
    
    return self;
}

- (NSURL *)image_url
{
    return [NSURL URLWithString:_image_urlString];
}

@end
