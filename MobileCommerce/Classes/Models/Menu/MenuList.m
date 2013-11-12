//
//  MenuList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MenuList.h"

@implementation MenuList

@synthesize userL = _userL;
@synthesize shopL = _shopL;

- (id)init
{
    self = [super init];
    if (self) {
//        [self gen_usermenu_list];
        _userL = [[NSMutableArray alloc] initWithCapacity:0];
        _shopL = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (NSInteger)UserCount
{
    return [_userL count];
}

- (NSInteger)ShopCount;
{
    return [_shopL count];
}

- (void)load
{
    NSArray * array;
    array = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"entity", @"MC", nil), @"title", @"EntityController", @"class", nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"nearby", @"MC", nil), @"title", @"ShopController", @"class", nil],
                       nil];
    
    for (NSDictionary * attributes in array) {
        Menu * _menu = [[Menu alloc] initWithAttributes:attributes];
        [_userL addObject:_menu];
    }
    
    
    array = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"my store", @"MC", nil), @"title", @"MyStoreController", @"class", nil],
//                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"nearby", @"MC", nil), @"title", @"ShopController", @"class", nil],
                       nil];
    
    for (NSDictionary * attributes in array) {
        Menu * _menu = [[Menu alloc] initWithAttributes:attributes];
        [_shopL addObject:_menu];
    }


}

- (id)objectAtUserLAtIndex:(NSUInteger)index
{
    return [_userL objectAtIndex:index];
}

- (id)objectAtShopLAtIndex:(NSInteger)index
{
    return [_shopL objectAtIndex:index];
}

@end
