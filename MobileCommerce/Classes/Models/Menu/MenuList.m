//
//  MenuList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MenuList.h"

@implementation MenuList

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}



- (void)load
{
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isLoading"];
//    NSArray * array;
    NSMutableArray * array = [NSMutableArray arrayWithObjects:
                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"entity", kLocalization, nil), @"title", @"EntityController", @"class", nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"nearby", kLocalization, nil), @"title", @"ShopController", @"class", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"my store", kLocalization, nil), @"title", @"MyStoreController", @"class", nil],
                       nil];

    for (NSDictionary * attributes in array) {
        Menu * _menu = [[Menu alloc] initWithAttributes:attributes];
        [self.dataList addObject:_menu];
    }
    
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
}

@end
