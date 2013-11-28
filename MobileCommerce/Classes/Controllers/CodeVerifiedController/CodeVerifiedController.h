//
//  CodeVerifiedController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-27.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VerifiedView.h"

@interface CodeVerifiedController : UIViewController <VerifiedViewDelegate>

@property (strong, nonatomic) VerifiedView * verifiedView;

@end
