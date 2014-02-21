//
//  StoreList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "StoreList.h"
#import "HttpRequest.h"
#import "UIImage+Helper.h"
#import "LocationManager.h"


@implementation StoreList

- (void)load
{
    [self setValue:[NSNumber numberWithInt:YES] forKey:@"isLoading"];
    [HttpRequest getDataWithParamters:nil URL:@"store" Block:^(id res, NSError *error) {
        if (!error) {
            for(NSDictionary * attributes in res) {
//                DLOG(@"%@", attributes);
                Store * store = [[Store alloc] initWithAttributes:attributes];
                [self.dataList addObject:store];
            }
        } else {
            self.error = error;
        }
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
    }];
}


- (void)createWithName:(NSString *)name Address:(NSString *)address Image:(UIImage *)image
{
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isCreating"];
    NSMutableDictionary *paramters = [NSMutableDictionary dictionaryWithCapacity:0];
    [paramters setValue:name forKey:@"store_name"];
    [paramters setValue:address forKey:@"address"];
    
    UIImage * store_image = [image scaleToSize:CGSizeMake(310., 310.)];
    [paramters setValue:[store_image base4String] forKey:@"image"];
//    DLOG(@"paramters %@", )
    [[LocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
//        DLOG(@"location %f, %f", locationCorrrdinate.latitude,locationCorrrdinate.longitude);

        [paramters setValue:[NSString stringWithFormat:@"%f,%f", locationCorrrdinate.latitude, locationCorrrdinate.longitude] forKey:@"gps"];
        DLOG(@"paramters %@", paramters);
        [HttpRequest postDataWithParamters:paramters URL:@"store/create" Block:^(id res, NSError *error) {
            if (!error) {
                Store * _store = [[Store alloc] initWithAttributes:res];
                [self.dataList insertObject:_store atIndex:0];
            } else {
                self.error = error;
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }
            [self setValue:[NSNumber numberWithBool:NO] forKey:@"isCreating"];
        }];
    }];
}

- (void)addTheObserverWithObject:(id)obj
{
    [self addObserver:obj forKeyPath:@"isLoading" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:obj forKeyPath:@"isRefreshing" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:obj forKeyPath:@"isCreating" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeTheObserverWithObject:(id)obj
{
    [self removeObserver:obj forKeyPath:@"isLoading"];
    [self removeObserver:obj forKeyPath:@"isRefreshing"];
    [self removeObserver:obj forKeyPath:@"isCreating"];
}



@end
