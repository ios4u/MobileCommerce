//
//  StoreList.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "DataList.h"
#import "Store.h"

@interface StoreList : DataList
{
    BOOL isCreating;
}


- (void)createWithName:(NSString *)name Address:(NSString *)address Image:(UIImage *)image;

@end
