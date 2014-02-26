//
//  EntityDetailController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Entity;

@interface EntityDetailController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Entity * entity;
@property (strong, nonatomic) UITableView * tableView;

@end
