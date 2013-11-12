//
//  MenuHeaderView.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuHeaderViewDelegate <NSObject>
- (void)TapSignInOrUp:(id)sender;
- (void)gotoUserProfileView:(id)sender;
@end

@interface MenuHeaderView : UIView


@property (weak, nonatomic) id <MenuHeaderViewDelegate> delegate;
@property (strong, nonatomic) UILabel * SignInOrUpL;
@property (strong, nonatomic) UIImageView * avatarView;
@property (strong, nonatomic) UILabel * usernameL;

@end
