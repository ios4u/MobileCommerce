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
        _usernameL.textColor = [UIColor blackColor];
        _usernameL.textAlignment = NSTextAlignmentCenter;
        _usernameL.text = [NSString stringWithFormat:@"%@:", NSLocalizedStringFromTable(@"username", kLocalization, nil)];
//        _usernameL.font = [UIFont systemFontOfSize:12.];
        
        _usernameTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _usernameTF.leftViewMode = UITextFieldViewModeAlways;
        _usernameTF.leftView = _usernameL;
        _usernameTF.textAlignment = NSTextAlignmentLeft;
//        _usernameTF.backgroundColor = [UIColor clearColor];
        _usernameTF.borderStyle = UITextBorderStyleRoundedRect;
        _usernameTF.placeholder = NSLocalizedStringFromTable(@"username", kLocalization, nil);
        _usernameTF.delegate = self;
        _usernameTF.returnKeyType = UIReturnKeyNext;
        _usernameTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _usernameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _passwdL = [[UILabel alloc] initWithFrame:CGRectZero];
        _passwdL.textColor = [UIColor blackColor];
        _passwdL.textAlignment = NSTextAlignmentCenter;
        _passwdL.text = [NSString stringWithFormat:@"%@:", NSLocalizedStringFromTable(@"password", kLocalization, nil)];
        
        _passwdTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _passwdTF.secureTextEntry = YES;
        _passwdTF.returnKeyType = UIReturnKeyGo;
        _passwdTF.leftViewMode = UITextFieldViewModeAlways;
        _passwdTF.leftView = _passwdL;
        _passwdTF.placeholder = NSLocalizedStringFromTable(@"password", kLocalization, nil);
        _passwdTF.borderStyle = UITextBorderStyleRoundedRect;
        _passwdTF.delegate = self;
        _passwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _signInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signInBtn setTitle:NSLocalizedStringFromTable(@"signin", kLocalization, nil) forState:UIControlStateNormal];
        _signInBtn.backgroundColor = [UIColor greenColor];
        
        [_signInBtn addTarget:self action:@selector(signInBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _signUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signUpBtn setTitle:NSLocalizedStringFromTable(@"signup", kLocalization, nil) forState:UIControlStateNormal];
        _signUpBtn.backgroundColor = [UIColor redColor];
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _usernameTF.frame = CGRectMake(20, 160., 280, 40);
    _usernameL.frame = CGRectMake(0., 0., 60, 20);
    
    _passwdTF.frame = CGRectMake(20., 210, 280, 40);
    _passwdL.frame = CGRectMake(0., 0., 60, 20);
    
    _signInBtn.frame = CGRectMake(20., 270., 120., 30);
    _signUpBtn.frame = CGRectMake(180., 270., 120., 30);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)hidenkeyboard
{
    [_usernameTF resignFirstResponder];
    [_passwdTF resignFirstResponder];
}

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

#pragma mark - UIText view Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    if (textField == _usernameTF) {
        return NO;
    }
    [self hidenkeyboard];
    if (_delegate && [_delegate respondsToSelector:@selector(TapSignInWithUsername:Passwd:)]) {
        [_delegate TapSignInWithUsername:_usernameTF.text Passwd:_passwdTF.text];
    }
    return YES;
}

@end
