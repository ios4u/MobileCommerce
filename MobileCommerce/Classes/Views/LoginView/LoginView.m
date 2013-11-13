//
//  LoginView.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 13-11-13.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

@synthesize delegate = _delegate;

@synthesize usernameL = _usernameL;
@synthesize passwdL = _passwdL;
@synthesize usernameTF = _usernameTF;
@synthesize passwdTF = _passwdTF;

@synthesize signInBtn = _signInBtn;
@synthesize signUpBtn = _signUpBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightGrayColor];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
