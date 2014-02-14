//
//  MenuList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MenuList.h"

@implementation MenuList

@synthesize array = _array;

- (id)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"entity", kLocalization, nil), @"title", @"EntityController", @"class", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"nearby", kLocalization, nil), @"title", @"ShopController", @"class", nil],
                  nil];
        
        if ([[UserCenter sharedUserCenter] isLogin]) {
            [_array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"my store", kLocalization, nil), @"title", @"MyStoreController", @"class", nil]];
            [_array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"signout", kLocalization, nil), @"title", nil]];
        }

    }
    return self;
}



- (void)load
{
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isLoading"];
//    NSArray * array;

    
    for (NSDictionary * attributes in _array) {
        Menu * _menu = [[Menu alloc] initWithAttributes:attributes];
        [self.dataList addObject:_menu];
    }
    
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
}

- (void)refresh
{
    [self.dataList removeAllObjects];
    if ([[UserCenter sharedUserCenter] isLogin]) {
        [_array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"my store", kLocalization, nil), @"title", @"MyStoreController", @"class", nil]];
        [_array addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"signout", kLocalization, nil), @"title", nil]];
    }
    for (NSDictionary * attributes in _array) {
        Menu * _menu = [[Menu alloc] initWithAttributes:attributes];
        [self.dataList addObject:_menu];
    }
    NSLog(@"menu data %@", _array);
}


@end
