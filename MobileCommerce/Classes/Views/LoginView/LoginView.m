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
        
        _usernameL = [[UILabel alloc] initWithFrame:CGRectZero];
        
        
        _signInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_signInBtn addTarget:self action:@selector(signInBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _signUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signUpBtn addTarget:self action:@selector(signUpBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_usernameL];
        [self addSubview:_passwdL];
        [self addSubview:_usernameTF];
        [self addSubview:_passwdTF];
        
        [self addSubview:_signInBtn];
        [self addSubview:_signUpBtn];
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

- (void)signInBtnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapSignInWithUsername:Passwd:)]) {
        [_delegate TapSignInWithUsername:_usernameTF.text Passwd:_passwdTF.text];
    }
}

- (void)signUpBtnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapSignUp)]) {
        [_delegate TapSignUp];
    }
}

@end
