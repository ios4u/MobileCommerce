//
//  LoginController.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 13-11-13.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "LoginView.h"

@interface LoginController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

//@property (strong, nonatomic) LoginView * loginView;
@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) UIBarButtonItem * dismissBarBtn;
@property (strong, nonatomic) UIButton * forgetPasswdBtn;
@end
