//
//  SignInCell.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-27.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol SignInCellDelegate <NSObject>
//
//
//
//@end

@interface SignInCell : UITableViewCell <UITextFieldDelegate>

@property (readwrite) BOOL isPasswd;
@property (strong, nonatomic) UILabel * titleL;
@property (strong, nonatomic) UITextField * formTF;

@end
