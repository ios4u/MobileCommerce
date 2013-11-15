//
//  StoreHeaderView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "StoreHeaderView.h"

@implementation StoreHeaderView

@synthesize storeNameL = _storeNameL;
@synthesize storeAddressBtn = _storeAddressBtn;
@synthesize storePhoneBtn = _storePhoneBtn;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        [self addSubview:_storeNameL];
        [self addSubview:_storeAddressBtn];
        [self addSubview:_storePhoneBtn];
        
    }
    return self;
}

#pragma mark - button action

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
