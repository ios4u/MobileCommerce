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
@synthesize codeTF = _codeTF;
@synthesize verfiedBtn = _verfiedBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.backgroundColor =
        self.backgroundColor = kDefaultBackgroundColor;
        
        _codeTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _codeTF.keyboardType = UIKeyboardTypeNumberPad;
        _codeTF.returnKeyType = UIReturnKeyGo;
        _codeTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _codeTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _codeTF.backgroundColor = [UIColor whiteColor];
        _codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _codeTF.borderStyle = UITextBorderStyleLine;
        _codeTF.layer.borderWidth = 0.5;
        
        
        _verfiedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_verfiedBtn setTitle:NSLocalizedStringFromTable(@"verify", kLocalization, nil) forState:UIControlStateNormal];
        [_verfiedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_verfiedBtn addTarget:self action:@selector(verfiedBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:_codeTF];
        [self addSubview:_verfiedBtn];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _codeTF.frame = CGRectMake(20., 108., 280, 44);
    
    _verfiedBtn.frame = CGRectMake(20, 160., 280., 44);
}


- (void)verfiedBtnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapCodeVerifiedWithCode:)]) {
        [_delegate TapCodeVerifiedWithCode:_codeTF.text];
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
