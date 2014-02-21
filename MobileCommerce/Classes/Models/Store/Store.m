//
//  Store.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "Store.h"
#import "HttpRequest.h"
#import "LocationManager.h"
#import "UIImage+Helper.h"

@implementation Store
{
@private
    NSString * _image_urlString;
}

@synthesize error = _error;
@synthesize store_id = _store_id;
@synthesize store_name = _store_name;
@synthesize address = _address;
@synthesize tel = _tel;
@synthesize desc = _desc;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isCreating"];
        [self setAttributes:attributes];
        
    }
    
    return self;
}

- (void)addTheObserverWithObj:(id)obj
{
    [self addObserver:obj forKeyPath:@"isCreating" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeTheObserverWithObj:(id)obj
{
    [self removeObserver:obj forKeyPath:@"isCreating"];
}

- (void)setAttributes:(NSDictionary *)attributes
{
    _store_id = [[attributes valueForKeyPath:@"store_id"] integerValue];
    _store_name = [attributes valueForKeyPath:@"store_name"];
    _address = [attributes valueForKeyPath:@"address"];
    _tel = [attributes valueForKeyPath:@"tel"];
    _desc = [attributes valueForKeyPath:@"desc"];
    _image_urlString = [attributes valueForKeyPath:@"image_url"];
}

- (NSURL *)image_url
{
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APIBase, _image_urlString]];
}

//- (void)loadStore
//{
//    [HttpRequest getDataWithParamters:nil URL:@"store" Block:^(id res, NSError *error) {
//        if (!error) {
//            DLOG(@"store %@", res);
//        } else {
//            _error = error;
//            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
//        }
//    }];
//}

- (void)createWithName:(NSString *)name Address:(NSString *)address Image:(UIImage *)image
{
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isCreating"];
    NSMutableDictionary *paramters = [NSMutableDictionary dictionaryWithCapacity:0];
    [paramters setValue:name forKey:@"store_name"];
    [paramters setValue:address forKey:@"address"];
    [paramters setValue:[image base4String] forKey:@"image"];
    
    [[LocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        DLOG(@"location %f, %f", locationCorrrdinate.latitude,locationCorrrdinate.longitude);
        [paramters setValue:[NSString stringWithFormat:@"%f,%f", locationCorrrdinate.latitude, locationCorrrdinate.longitude] forKey:@"gps"];
        [HttpRequest postDataWithParamters:paramters URL:@"store/create" Block:^(id res, NSError *error) {
            if (!error) {
                [self setAttributes:res];
            } else {
                _error = error;
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }
            [self setValue:[NSNumber numberWithBool:NO] forKey:@"isCreating"];
        }];
    }];
}

- (void)updateWithName:(NSString *)name Address:(NSString *)address
{

}

@end
