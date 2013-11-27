//
//  SignUpController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-16.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "SignUpView.h"

@interface SignUpController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

//@property (strong, nonatomic) SignUpView * signUpView;
@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) UITextField * usernameTF;
@property (strong, nonatomic) UITextField * passwdTF;
@property (strong, nonatomic) UITextField * mobilePhoneTF;

@end
