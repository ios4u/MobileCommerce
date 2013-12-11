//
//  SignInController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-12-2.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) UITextField * usernameTF;
@property (strong, nonatomic) UITextField * passwdTF;
@property (strong, nonatomic) UIBarButtonItem * signInBarBtn;

@end
