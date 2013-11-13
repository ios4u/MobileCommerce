//
//  OpenCenterController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "OpenCenterController.h"
//#import "LoginController.h"

@implementation OpenCenterController

@synthesize controller = _controller;

DEFINE_SINGLETON_FOR_CLASS(OpenCenterController);


- (id)init
{
    self = [super init];
    if (self) {
        _controller = [[UIApplication sharedApplication] keyWindow].rootViewController;
    }
    return self;
}

- (void)openLoginController
{
//    [self.controller pres]
    Class loginClass = NSClassFromString(kLoginController);
    UIViewController * controller = [[loginClass alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.controller presentViewController:nav animated:YES completion:nil];
}

@end
