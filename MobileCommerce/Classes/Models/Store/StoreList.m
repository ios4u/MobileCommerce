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

//- (void)createWithName:(NSString *)name Address:(NSString *)address Image:(UIImage *)image
//{
//    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isCreating"];
//    NSMutableDictionary *paramters = [NSMutableDictionary dictionaryWithCapacity:0];
//    [paramters setValue:name forKey:@"store_name"];
//    [paramters setValue:address forKey:@"address"];
//    
//    [[LocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
//        DLOG(@"location %f, %f", locationCorrrdinate.latitude,locationCorrrdinate.longitude);
//        [paramters setValue:[NSString stringWithFormat:@"%f,%f", locationCorrrdinate.latitude, locationCorrrdinate.longitude] forKey:@"gps"];
//        [HttpRequest postDataWithParamters:paramters URL:@"store/create" Block:^(id res, NSError *error) {
//            if (!error) {
//                [self setAttributes:res];
//            } else {
//                _error = error;
//                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
//            }
//            [self setValue:[NSNumber numberWithBool:NO] forKey:@"isCreating"];
//        }];
//    }];
//}


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
