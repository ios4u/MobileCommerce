//
//  StoreController.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-20.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;
@class StoreEntityList;

@interface StoreController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Store * store;
@property (strong, nonatomic) StoreEntityList * entities;
@property (strong, nonatomic) UITableView * tableview;

@end
