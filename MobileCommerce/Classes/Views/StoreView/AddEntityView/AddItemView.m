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
//@synthesize itemImageV = _itemImageV;
//@synthesize itemNameL = _itemNameL;
//@synthesize itemNameTF = _itemNameTF;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = kDefaultBackgroundColor;
        
        
        _itemImageV = [[MCImageView alloc] initWithFrame:CGRectZero];
        _itemImageV.backgroundColor = [UIColor redColor];
        _itemImageV.delegate = self;

        
        [self addSubview:_itemImageV];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _itemImageV.frame = CGRectMake(40, 20, 128, 128);

}

- (void)TapImageView:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapEntityImage:)]) {
        [_delegate TapEntityImage:sender];
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
