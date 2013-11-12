//
//  Entity.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "Entity.h"

@implementation Entity
{
@private
    NSString * _image_urlString;
}

@synthesize entity_id = _entity_id;
@synthesize store_id = _store_id;
//@synthesize image_url = _image_url;
@synthesize title = _title;
@synthesize desc = _desc;
@synthesize store_name = _store_name;
@synthesize price = _price;
//@synthesize <#property#>


- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        _entity_id = [[attributes valueForKeyPath:@"entity_id"] integerValue];
        _store_id = [[attributes valueForKeyPath:@"store_id"] integerValue];
        _image_urlString = [attributes valueForKeyPath:@"image_url"];
        _title = [attributes valueForKeyPath:@"title"];
        _desc = [attributes valueForKeyPath:@"desc"];
        _store_name = [attributes valueForKeyPath:@"store_name"];
        _price = [[attributes valueForKeyPath:@"price"] floatValue];
    }
    
    return self;
}

- (NSURL *)image_url
{
    return [NSURL URLWithString:_image_urlString];
}

@end
