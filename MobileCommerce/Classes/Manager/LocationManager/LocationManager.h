//
//  LocationManager.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-19.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define  MMLastLongitude @"MMLastLongitude"
#define  MMLastLatitude  @"MMLastLatitude"
#define  MMLastCity      @"MMLastCity"
#define  MMLastAddress   @"MMLastAddress"

typedef void (^LocationBlock)(CLLocationCoordinate2D locationCorrrdinate);
typedef void (^LocationErrorBlock) (NSError *error);
typedef void (^NSStringBlock)(NSString *cityString);
typedef void (^NSStringBlock)(NSString *addressString);

@interface LocationManager : NSObject <MKMapViewDelegate>

@property (nonatomic,strong) MKMapView *mapView;
@property (nonatomic) CLLocationCoordinate2D lastCoordinate;
@property (nonatomic,strong) NSString *lastCity;
@property (nonatomic,strong) NSString *lastAddress;

@property (nonatomic,assign) float latitude;
@property (nonatomic,assign) float longitude;

+ (LocationManager *)shareLocation;

@end
