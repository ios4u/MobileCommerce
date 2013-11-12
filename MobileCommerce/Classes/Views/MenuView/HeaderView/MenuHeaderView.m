//
//  MenuHeaderView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MenuHeaderView.h"

@implementation MenuHeaderView

@synthesize SignInOrUpBtn = _SignInOrUpBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _SignInOrUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _SignInOrUpBtn = []
        
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

@end
