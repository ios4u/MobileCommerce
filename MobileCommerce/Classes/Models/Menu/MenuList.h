//
//  MenuList.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataList.h"
#import "Menu.h"

@interface MenuList : DataList

@property (strong, nonatomic) NSMutableArray * array;

- (void)load;

@end
