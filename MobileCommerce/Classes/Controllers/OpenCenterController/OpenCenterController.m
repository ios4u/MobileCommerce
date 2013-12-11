//
//  OpenCenterController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "OpenCenterController.h"
//#import "AddEntityController.h"
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
    Class loginClass = NSClassFromString(kUserCenterController);
    UIViewController * controller = [[loginClass alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.controller presentViewController:nav animated:YES completion:nil];
}

- (void)openAddItemController
{
//    AddEntityController * controller = [[AddEntityController alloc] init];
    Class addItemClass = NSClassFromString(kAddItemController);
    UIViewController * controller = [[addItemClass alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.controller presentViewController:nav animated:YES completion:nil];

}

@end
