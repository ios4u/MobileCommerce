//
//  MenuHeaderController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuHeaderView.h"

@interface MenuHeaderController : UIViewController <MenuHeaderViewDelegate>

@property (strong, nonatomic) MenuHeaderView * headerView;

@end
