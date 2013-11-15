//
//  AddItemView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "AddItemView.h"

@implementation AddItemView

@synthesize delegate = _delegate;
@synthesize itemImageV = _itemImageV;
@synthesize itemNameL = _itemNameL;
@synthesize itemNameTF = _itemNameTF;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightGrayColor];
        
        
        _itemImageV = [[MCImageView alloc] initWithFrame:CGRectZero];
        _itemImageV.backgroundColor = [UIColor redColor];
        _itemImageV.delegate = self;
        
        
        _itemNameL = [[UILabel alloc] initWithFrame:CGRectZero];
        _itemNameL.text = NSLocalizedStringFromTable(@"item name", kLocalization, nil);
        _itemNameL.textAlignment = NSTextAlignmentCenter;
        _itemNameL.textColor = [UIColor blackColor];
        
        _itemNameTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _itemNameTF.placeholder = NSLocalizedStringFromTable(@"item name", kLocalization, nil);
        _itemNameTF.leftViewMode = UITextFieldViewModeAlways;
        _itemNameTF.leftView = _itemNameL;
        _itemNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _itemNameTF.borderStyle = UITextBorderStyleRoundedRect;
        
        _priceL = [[UILabel alloc] initWithFrame:CGRectZero];
        _priceL.text = NSLocalizedStringFromTable(@"price", kLocalization, nil);
        _priceL.textAlignment = NSTextAlignmentCenter;
        _priceL.textColor = [UIColor blackColor];
        
        _priceTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _priceTF.placeholder = NSLocalizedStringFromTable(@"price", kLocalization, nil);
        _priceTF.leftViewMode = UITextFieldViewModeAlways;
        _priceTF.leftView = _priceL;
        _priceTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _priceTF.borderStyle = UITextBorderStyleRoundedRect;
        
        [self addSubview:_itemImageV];
        [self addSubview:_itemNameL];
        [self addSubview:_itemNameTF];
        [self addSubview:_priceL];
        [self addSubview:_priceTF];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _itemImageV.frame = CGRectMake(40, 100, 128, 128);
    _itemNameTF.frame = CGRectMake(40, 238., 240, 40);
    _itemNameL.frame = CGRectMake(0., 0., 60, 40);
    
    _priceTF.frame = CGRectMake(40, 288, 240, 40);
    _priceL.frame = CGRectMake(0., 0., 60., 40.);
}

- (void)TapImageView:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(openPickerImager:)]) {
        [_delegate openPickerImager:sender];
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
