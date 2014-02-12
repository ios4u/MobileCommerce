//
//  BCAppDelegate.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-8.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "BCAppDelegate.h"
#import "RootController.h"

@implementation BCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//    if(OSVersionIsAtLeastiOS7()){
//        UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
//                                              green:173.0/255.0
//                                               blue:234.0/255.0
//                                              alpha:1.0];
//        [self.window setTintColor:tintColor];
//    }
    self.window.rootViewController = [RootController sharedRootController];
//    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSString * key = [identifierComponents lastObject];

    if ([key isEqualToString:MCCenterNavigationControllerRestorationKey]) {
        return ((MMDrawerController *)self.window.rootViewController).centerViewController;
    } else if ([key isEqualToString:MCLeftNavigationControllerRestorationKey]) {
        return ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
    }
    return self.window.rootViewController;
}

@end
