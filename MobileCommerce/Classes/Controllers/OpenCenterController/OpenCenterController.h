//
//  OpenCenterController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpenCenterController : NSObject

@property (strong, nonatomic) UIViewController * controller;

DEFINE_SINGLETON_FOR_HEADER(OpenCenterController);


- (void)openLoginController;
- (void)openUserProfileController;
- (void)openAddItemController;
//- (void)openCreateStoreController;
- (void)openCreateStoreControllerWithStores:(id)stores;
@end
