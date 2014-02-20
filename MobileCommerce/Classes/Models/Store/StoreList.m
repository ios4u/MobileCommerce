//
//  StoreList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "StoreList.h"
#import "HttpRequest.h"


@implementation StoreList

- (void)load
{
    [self setValue:[NSNumber numberWithInt:YES] forKey:@"isLoading"];
    [HttpRequest getDataWithParamters:nil URL:@"store" Block:^(id res, NSError *error) {
        if (!error) {
            for(NSDictionary * attributes in res) {
                DLOG(@"%@", attributes);
                Store * store = [[Store alloc] initWithAttributes:attributes];
                [self.dataList addObject:store];
            }
        } else {
            self.error = error;
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
    }];
}

//- (void)r

@end
