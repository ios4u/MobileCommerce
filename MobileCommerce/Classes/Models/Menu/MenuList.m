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
    NSArray * array;
    array = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"entity", @"MC", nil), @"title", @"EntityController", @"class", nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"nearby", @"MC", nil), @"title", @"ShopController", @"class", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedStringFromTable(@"my store", @"MC", nil), @"title", @"MyStoreController", @"class", nil],
                       nil];
    
    for (NSDictionary * attributes in array) {
        Menu * _menu = [[Menu alloc] initWithAttributes:attributes];
        [self.dataList addObject:_menu];
    }
    
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
}

@end
