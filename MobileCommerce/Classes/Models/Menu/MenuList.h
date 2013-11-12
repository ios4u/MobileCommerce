//
//  MenuList.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"

@interface MenuList : NSObject

@property (strong, nonatomic) NSMutableArray * userL;
@property (strong, nonatomic) NSMutableArray * shopL;

- (NSInteger)UserCount;
- (NSInteger)ShopCount;
- (void)load;

- (id)objectAtUserLAtIndex:(NSUInteger)index;
- (id)objectAtShopLAtIndex:(NSInteger)index;
@end
