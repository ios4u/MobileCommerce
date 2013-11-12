//
//  RootController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-8.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "RootController.h"
#import "MMDrawerVisualState.h"
#import "EntityController.h"
#import "MenuController.h"

@interface RootController ()

@end

@implementation RootController


+ (RootController *)sharedRootController
{
    
    UIViewController * centerController = [[EntityController alloc] initWithNibName:nil bundle:nil];
    UINavigationController * navCenter = [[UINavigationController alloc] initWithRootViewController:centerController];
    
    UIViewController * menuController = [[MenuController alloc] initWithNibName:nil bundle:nil];
//    UINavigationController * navMenu = [[UINavigationController alloc] initWithRootViewController:menuController];
    
    static RootController * controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[RootController alloc] initWithCenterViewController:navCenter
                                                 leftDrawerViewController:menuController];
    });
    [controller setShowsShadow:NO];
    [controller setMaximumLeftDrawerWidth:240.];
    [controller setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [controller setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [controller setDrawerVisualStateBlock:nil];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
