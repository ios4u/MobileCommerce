//
//  LocationManager.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-19.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "LocationManager.h"

@interface LocationManager ()

@property (nonatomic, strong) LocationBlock locationBlock;
@property (nonatomic, strong) NSStringBlock cityBlock;
@property (nonatomic, strong) NSStringBlock addressBlock;
@property (nonatomic, strong) LocationErrorBlock errorBlock;

@end

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

- (void) getLocationCoordinate:(LocationBlock) locaiontBlock
{
    self.locationBlock = [locaiontBlock copy];
    [self startLocation];
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
    CLLocation * newLocation = userLocation.location;
    _lastCoordinate = userLocation.location.coordinate;
//    DLOG(@"location %@", newLocation);
    CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
    CLGeocodeCompletionHandler handle = ^(NSArray *placemarks,NSError *error) {
//
        for (CLPlacemark * placeMark in placemarks){
            DLOG(@"address %@", placeMark);
            [self stopLocation];
        }
//
        if (_locationBlock) {
            _locationBlock(_lastCoordinate);
            _locationBlock = nil;
        }
    };
    [clGeoCoder reverseGeocodeLocation:newLocation completionHandler:handle];
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    DLOG(@"ERROR: %@", error);
    [self stopLocation];
}

@end
