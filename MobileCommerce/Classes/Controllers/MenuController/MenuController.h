//
//  MenuController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-8.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ListController.h"
#import "MenuHeaderController.h"
@class MenuList;

@interface MenuController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) MenuList * data;
@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) MenuHeaderController * headerController;

@end
