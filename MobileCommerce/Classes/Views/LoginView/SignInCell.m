//
//  SignInCell.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-27.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "SignInCell.h"

@implementation SignInCell

@synthesize isPasswd = _isPasswd;
@synthesize titleL = _titleL;
@synthesize formTF = _formTF;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _titleL = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleL.textAlignment = NSTextAlignmentCenter;
        
        _formTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _formTF.backgroundColor = [UIColor clearColor];
        _formTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _formTF.leftViewMode = UITextFieldViewModeAlways;
        _formTF.leftView = _titleL;
        _formTF.delegate = self;
        _formTF.adjustsFontSizeToFitWidth = YES;
        _formTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _formTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [self.contentView addSubview:_titleL];
        [self.contentView addSubview:_formTF];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFormWithTitle:(NSString *)title Placeholder:(NSString *)placeholder
{
    self.titleL.text = [NSString stringWithFormat:@"%@:", title];
    self.formTF.placeholder = placeholder;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_isPasswd) {
        _formTF.secureTextEntry = YES;
        _formTF.returnKeyType = UIReturnKeyGo;
    } else {
        _formTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    _formTF.frame = CGRectMake(0., 0., WIDTH, 44);
    _titleL.frame = CGRectMake(0., 0., 80, 40);
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

@end
