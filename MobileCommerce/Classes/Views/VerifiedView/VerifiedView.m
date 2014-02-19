//
//  VerifiedView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-27.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "VerifiedView.h"

@implementation VerifiedView

@synthesize delegate = _delegate;
@synthesize mobile = _mobile;
@synthesize phoneL = _phoneL;
@synthesize sendSMSBtn = _sendSMSBtn;
@synthesize codeTF = _codeTF;
@synthesize verfiedBtn = _verfiedBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.backgroundColor =
        self.backgroundColor = kDefaultBackgroundColor;
        
        
        _phoneL = [[UILabel alloc] initWithFrame:CGRectZero];
        _phoneL.textAlignment = NSTextAlignmentLeft;
        
        _sendSMSBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendSMSBtn setTitle:NSLocalizedStringFromTable(@"send code", kLocalization, nil) forState:UIControlStateNormal];
        [_sendSMSBtn setTitle:@"已经发送" forState:UIControlStateDisabled];
        [_sendSMSBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_sendSMSBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_sendSMSBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [_sendSMSBtn addTarget:self action:@selector(sendSMSBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _codeTF = [[UITextField alloc] initWithFrame:CGRectZero];
//        _codeTF.
        _codeTF.keyboardType = UIKeyboardTypeNumberPad;
        _codeTF.returnKeyType = UIReturnKeyGo;
        _codeTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _codeTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _codeTF.backgroundColor = [UIColor whiteColor];
        _codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _codeTF.borderStyle = UITextBorderStyleRoundedRect;
//        _codeTF.layer.borderWidth = 0.5;
//        _codeTF.layer.borderColor = [UIColor lightGrayColor].;
        
        _verfiedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_verfiedBtn setTitle:NSLocalizedStringFromTable(@"verify", kLocalization, nil) forState:UIControlStateNormal];
        [_verfiedBtn setTitle:@"已验证" forState:UIControlStateDisabled];
        [_verfiedBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_verfiedBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_verfiedBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [_verfiedBtn addTarget:self action:@selector(verfiedBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_phoneL];
        [self addSubview:_sendSMSBtn];
        [self addSubview:_codeTF];
        [self addSubview:_verfiedBtn];
        
    }
    return self;
}

- (void)setMobile:(NSString *)mobile
{
    _mobile = mobile;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    _phoneL.text = _mobile;
    _phoneL.frame = CGRectMake(20., 108., 140, 44);
    
    if (![[UserCenter sharedUserCenter] isAuth])
    {
        _sendSMSBtn.frame = CGRectMake(200., 108., 80., 44);
        _codeTF.frame = CGRectMake(20., 162., 160, 44);
        _verfiedBtn.frame = CGRectMake(200, 162, 60, 44);
    } else {
//        _sendSMSBtn.enabled = NO;
        _verfiedBtn.frame = CGRectMake(200, 108, 60, 44);
        _verfiedBtn.enabled = NO;
    }
}


#pragma mark - button action
- (void)verfiedBtnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapCodeVerifiedWithCode:)]) {
        [_delegate TapCodeVerifiedWithCode:_codeTF.text];
    }
}

- (void)sendSMSBtnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapSendSMSWithPhone:)])
    {
        [_delegate TapSendSMSWithPhone:_mobile];
    }
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
