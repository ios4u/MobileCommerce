//
//  AddEntityController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemView.h"

@interface AddEntityController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AddItemViewDelegate>

@property (strong, nonatomic) AddItemView * addItemView;


@end
