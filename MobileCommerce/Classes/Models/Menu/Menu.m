//
//  Menu.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "Menu.h"

@implementation Menu

@synthesize title = _title;
@synthesize klass = _klass;


- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        _title = [attributes valueForKeyPath:@"title"];
        _klass = [attributes valueForKeyPath:@"class"];
    }
    return self;
}

@end
