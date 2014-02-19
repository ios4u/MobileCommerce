//
//  LocationManager.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-19.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

@synthesize mapView = _mapView;
@synthesize lastCoordinate = _lastCoordinate;
@synthesize lastCity = _lastCity;
@synthesize lastAddress = _lastAddress;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;


+ (LocationManager *)shareLocation
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
        
        float longitude = [standard floatForKey:MMLastLongitude];
        float latitude = [standard floatForKey:MMLastLatitude];
        self.longitude = longitude;
        self.latitude = latitude;
        self.lastCoordinate = CLLocationCoordinate2DMake(longitude,latitude);
        self.lastCity = [standard objectForKey:MMLastCity];
        self.lastAddress=[standard objectForKey:MMLastAddress];
    }
    return self;
}


- (void)startLocation
{
    if (_mapView) {
        _mapView = nil;
    }
    
    _mapView = [[MKMapView alloc] init];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
}

- (void)stopLocation
{
    _mapView.showsUserLocation = NO;
    _mapView = nil;
}

#pragma mark - mapview delegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    [self stopLocation];
}

@end
