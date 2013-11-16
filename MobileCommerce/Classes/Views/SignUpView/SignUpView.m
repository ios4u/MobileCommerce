//
//  SignUpView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-16.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "SignUpView.h"

@implementation SignUpView

@synthesize delegate = _delegate;
@synthesize usernameL = _usernameL;
@synthesize usernameTF = _usernameTF;
@synthesize passwdL = _passwdL;
@synthesize passwdTF = _passwdTF;
@synthesize phoneL = _phoneL;
@synthesize phoneTF = _phoneTF;
@synthesize submitBtn = _submitBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor grayColor];
        
        _usernameL = [[UILabel alloc] initWithFrame:CGRectZero];
        _usernameL.textAlignment = NSTextAlignmentRight;
        _usernameL.textColor = [UIColor blackColor];
        _usernameL.text = [NSString stringWithFormat:@"%@:", NSLocalizedStringFromTable(@"username", kLocalization, nil)];
        _usernameL.backgroundColor = [UIColor clearColor];
        
        _usernameTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _usernameTF.textAlignment = NSTextAlignmentLeft;
        _usernameTF.placeholder = NSLocalizedStringFromTable(@"username", kLocalization, nil);
        _usernameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _usernameTF.leftViewMode = UITextFieldViewModeAlways;
        _usernameTF.leftView = _usernameL;
        _usernameTF.borderStyle = UITextBorderStyleRoundedRect;
        
        
        _passwdL = [[UILabel alloc] initWithFrame:CGRectZero];
        _passwdL.textAlignment = NSTextAlignmentRight;
        _passwdL.textColor = [UIColor blackColor];
        _passwdL.text = [NSString stringWithFormat:@"%@:", NSLocalizedStringFromTable(@"password", kLocalization, nil)];
        _passwdL.backgroundColor = [UIColor clearColor];
        
        _passwdTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _passwdTF.secureTextEntry = YES;
        _passwdTF.textAlignment = NSTextAlignmentLeft;
        _passwdTF.placeholder = NSLocalizedStringFromTable(@"password", kLocalization, nil);
        _passwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwdTF.leftViewMode = UITextFieldViewModeAlways;
        _passwdTF.leftView = _passwdL;
        _passwdTF.borderStyle = UITextBorderStyleRoundedRect;
        
        
        _phoneL = [[UILabel alloc] initWithFrame:CGRectZero];
        _phoneL.textAlignment = NSTextAlignmentRight;
        _phoneL.textColor = [UIColor blackColor];
        _phoneL.text = [NSString stringWithFormat:@"%@:", NSLocalizedStringFromTable(@"phone number", kLocalization, nil)];
        _phoneL.backgroundColor = [UIColor clearColor];
        
        _phoneTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _phoneTF.textAlignment = NSTextAlignmentLeft;
        _phoneTF.placeholder = NSLocalizedStringFromTable(@"phone number", kLocalization, nil);
        _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTF.leftViewMode = UITextFieldViewModeAlways;
        _phoneTF.leftView = _phoneL;
        _phoneTF.borderStyle = UITextBorderStyleRoundedRect;
        
        
        [self addSubview:_usernameL];
        [self addSubview:_usernameTF];
        [self addSubview:_passwdL];
        [self addSubview:_passwdTF];
        [self addSubview:_phoneL];
        [self addSubview:_phoneTF];
        [self addSubview:_submitBtn];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _usernameTF.frame = CGRectMake(20., 100., WIDTH - 20 * 2 , 40);
    _usernameL.frame = CGRectMake(0., 0., 80, 20.);
    
    _passwdTF.frame = CGRectMake(20., 160., WIDTH - 20 * 2, 40);
    _passwdL.frame = CGRectMake(0., 0., 80., 20.);
    
    _phoneTF.frame = CGRectMake(20., 220, WIDTH - 20 * 2, 40);
    _phoneL.frame = CGRectMake(0., 0., 80., 20.);
    
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
