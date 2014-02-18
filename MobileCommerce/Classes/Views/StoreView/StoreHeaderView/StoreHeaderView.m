//
//  StoreHeaderView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "StoreHeaderView.h"

@implementation StoreHeaderView

@synthesize delegate = _delegate;
@synthesize store = _store;
@synthesize storeNameL = _storeNameL;
@synthesize storeAddressBtn = _storeAddressBtn;
@synthesize storePhoneBtn = _storePhoneBtn;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = kDefaultBackgroundColor;
        _storeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//        [_storeImageView seth]
//        _storeImageView.backgroundColor = [UIColor blueColor];
        _storeImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        _storeNameL = [[UILabel alloc] initWithFrame:CGRectZero];
        _storeNameL.textAlignment = NSTextAlignmentLeft;
        _storeNameL.textColor = [UIColor blackColor];
        _storeNameL.font = [UIFont systemFontOfSize:17.];
//        _storeNameL.backgroundColor = [UIColor redColor];
        
        _storeAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [_storeAddressBtn addTarget:self action:@selector(storeAddressBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_storeAddressBtn setTitle:@"..." forState:UIControlStateNormal];
        
        _storePhoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_storePhoneBtn setTitle:@"..." forState:UIControlStateNormal];
        [_storePhoneBtn addTarget:self action:@selector(storePhoneBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_storeImageView];
        [self addSubview:_storeNameL];
        [self addSubview:_storeAddressBtn];
        [self addSubview:_storePhoneBtn];
        
    }
    return self;
}

- (void)setStore:(Store *)store
{
    _store = store;
    
    _storeNameL.text = _store.store_name;
    [_storeAddressBtn setTitle:_store.address forState:UIControlStateNormal];
    [_storePhoneBtn setTitle:_store.tel forState:UIControlStateNormal];
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _storeImageView.frame = CGRectMake(20., 20., 80, 80);
    _storeNameL.frame = CGRectMake(120., 40., 180, 20);
    
}

#pragma mark - button action

- (void)storeAddressBtnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapAddressBtn:)]) {
        [_delegate TapAddressBtn:_store.address];
    }
}

- (void)storePhoneBtnAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapPhoneBtn:)]) {
        [_delegate TapPhoneBtn:_store.tel];
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
