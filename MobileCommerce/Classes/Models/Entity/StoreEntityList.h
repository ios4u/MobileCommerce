//
//  StoreEntityList.h
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-18.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "DataList.h"

@interface StoreEntityList : DataList
{

}

- (void)loadWithStoreId:(NSInteger)store_id;
- (void)createWithImage:(UIImage *)image Title:(NSString *)title Price:(NSString *)price Desc:(NSString *)desc;


@end
