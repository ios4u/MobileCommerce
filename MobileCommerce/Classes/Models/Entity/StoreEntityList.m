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
    [self.dataList removeAllObjects];
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isLoading"];
    NSMutableDictionary * paramters = [NSMutableDictionary dictionaryWithCapacity:1];
    [paramters setValue:[NSNumber numberWithInteger:store_id] forKey:@"store_id"];
    DLOG(@"paramters %@", paramters);
    
    [HttpRequest getDataWithParamters:paramters URL:@"store/item/" Block:^(id res, NSError *error) {
        if (!error) {
            //            DLOG(@"error %@", error);
            DLOG(@"res %@", res);
            for (NSDictionary * attr in res) {
                Entity * entity = [[Entity alloc] initWithAttributes:attr];
                [self.dataList addObject:entity];
            }
        } else {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
    }];
}

- (void)createEntityWithStoreID:(NSInteger)store_id Image:(UIImage *)image Title:(NSString *)title Price:(NSString *)price Desc:(NSString *)desc
{
    self.error = nil;
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isCreating"];
    NSMutableDictionary * paramters = [NSMutableDictionary dictionaryWithCapacity:0];
    [paramters setValue:[NSNumber numberWithInteger:store_id] forKey:@"store_id"];
    [paramters setValue:title forKey:@"name"];
    [paramters setValue:price forKey:@"price"];
    [paramters setValue:desc forKey:@"desc"];
//    [paramters setValue:<#(id)#> forKey:<#(NSString *)#>]
    UIImage * item_image = [image scaleToSize:CGSizeMake(310., 310.)];
    
    [paramters setValue:[item_image base4String] forKey:@"image"];
    
    DLOG(@"paramters %@", paramters);
    [HttpRequest postDataWithParamters:paramters URL:@"store/item/create" Block:^(id res, NSError *error) {
        if (!error) {
            DLOG(@"res %@", res);
//            for ()
            Entity * _entity = [[Entity alloc] initWithAttributes:res];
            [self.dataList insertObject:_entity atIndex:0];
        } else {
            self.error = error;
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isCreating"];
    }];
}

- (void)addTheObserverWithObject:(id)obj
{
    [self addObserver:obj forKeyPath:@"isLoading" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:obj forKeyPath:@"isCreating" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeTheObserverWithObject:(id)obj
{
    [self removeObserver:obj forKeyPath:@"isLoading"];
    [self removeObserver:obj forKeyPath:@"isCreating"];
}

@end
