//
//  StoreEntityList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-18.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "StoreEntityList.h"
#import "HttpRequest.h"
#import "UIImage+Helper.h"


@implementation StoreEntityList


- (void)loadWithStoreId:(NSInteger)store_id
{
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isLoading"];
    NSMutableDictionary * paramters = [NSMutableDictionary dictionaryWithCapacity:1];
    [paramters setValue:[NSNumber numberWithInteger:store_id] forKey:@"store_id"];
    DLOG(@"paramters %@", paramters);
    
    [HttpRequest getDataWithParamters:paramters URL:@"store/item/" Block:^(id res, NSError *error) {
        if (!error) {
            //            DLOG(@"error %@", error);
            DLOG(@"res %@", res);
        } else {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
    }];
}

- (void)createWithImage:(UIImage *)image Title:(NSString *)title Price:(NSString *)price Desc:(NSString *)desc
{
    NSMutableDictionary * paramters = [NSMutableDictionary dictionaryWithCapacity:0];
    [paramters setValue:title forKey:@"item_name"];
    [paramters setValue:price forKey:@"price"];
    [paramters setValue:desc forKey:@"desc"];
//    [paramters setValue:<#(id)#> forKey:<#(NSString *)#>]
    [paramters setValue:[image base4String] forKey:@"image"];
    
    DLOG(@"paramters %@", paramters);
    [HttpRequest postDataWithParamters:paramters URL:@"store/item/create" Block:^(id res, NSError *error) {
        if (!error) {
            DLOG(@"%@", res);
        } else {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
    }];
}

- (void)addTheObserverWithObject:(id)obj
{

}

- (void)removeTheObserverWithObject:(id)obj
{

}

@end
