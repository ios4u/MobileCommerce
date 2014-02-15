//
//  EntityList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "EntityList.h"
#import "HttpRequest.h"

@implementation EntityList


- (id)init
{
    self = [super init];
    if (self) {
//        _list = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}



- (void)load
{
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isLoading"];
    
    [HttpRequest getDataWithParamters:nil URL:@"store/item/" Block:^(id res, NSError *error) {
        if (!error) {
//            NSLog(@"error %@", error.localizedDescription);
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        } else {
        
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
    }];
}

@end
