//
//  UserCenterViewController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-12-2.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCenterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) UIBarButtonItem * dismissBarBtn;
@end
