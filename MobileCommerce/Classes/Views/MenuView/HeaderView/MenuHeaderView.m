//
//  MenuHeaderView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MenuHeaderView.h"

@implementation MenuHeaderView

@synthesize delegate = _delegate;
@synthesize SignInOrUpL = _SignInOrUpL;
@synthesize avatarView = _avatarView;
@synthesize usernameL = _usernameL;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _SignInOrUpL = [[UILabel alloc] initWithFrame:CGRectZero];
        _SignInOrUpL.textAlignment = NSTextAlignmentLeft;
        _SignInOrUpL.text = NSLocalizedStringFromTable(@"sign in or up", kLocalization, nil);
        _SignInOrUpL.textColor = [UIColor whiteColor];
        _SignInOrUpL.font = [UIFont systemFontOfSize:14.];

        
        _avatarView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _avatarView.backgroundColor = [UIColor redColor];
        
        _usernameL = [[UILabel alloc] initWithFrame:CGRectZero];
        _usernameL.backgroundColor = [UIColor blueColor];
        _usernameL.textAlignment = NSTextAlignmentLeft;
        _usernameL.textColor = [UIColor whiteColor];
        _usernameL.font = [UIFont systemFontOfSize:14.];
        
        [self addSubview:_SignInOrUpL];
        [self addSubview:_avatarView];
        [self addSubview:_usernameL];
        
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([[UserCenter sharedUserCenter] isLogin]) {
        _SignInOrUpL.hidden = YES;
        _usernameL.hidden = NO;
        _avatarView.hidden = NO;
        
        _avatarView.frame = CGRectMake(20, 30, 40, 40);
        _usernameL.frame = CGRectMake(70., 45, 160, 20);
        
    } else {
        _SignInOrUpL.hidden = NO;
        _usernameL.hidden = YES;
        _avatarView.hidden = YES;
        _SignInOrUpL.frame = CGRectMake(20., 30., 200., 40);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!_SignInOrUpL.hidden && [_delegate respondsToSelector:@selector(TapSignInOrUp:)]) {
        [_delegate TapSignInOrUp:self];
    } else if ([_delegate respondsToSelector:@selector(gotoUserProfileView:)]){
        [_delegate gotoUserProfileView:self];
    }
}

@end
