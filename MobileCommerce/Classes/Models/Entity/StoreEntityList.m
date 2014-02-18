//
//  StoreEntityList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-18.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "StoreEntityList.h"
#import "HttpRequest.h"


@implementation StoreEntityList

- (void)load
{
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isLoading"];
    
    [HttpRequest getDataWithParamters:nil URL:@"store/item/" Block:^(id res, NSError *error) {
        if (!error) {
            //            NSLog(@"error %@", error.localizedDescription);
            NSLog(@"res  %@", res);
        } else {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
    }];
}

- (void)create
{
    [HttpRequest postDataWithParamters:nil URL:@"store/item/create" Block:^(id res, NSError *error) {
        if (!error) {
            NSLog(@"%@", res);
        } else {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
    }];
}

@end
