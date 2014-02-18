//
//  AddEntityController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemView.h"

@class StoreEntityList;
@interface AddEntityController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate,UITableViewDataSource, UITableViewDelegate, AddItemViewDelegate>



@property (strong, nonatomic) AddItemView * addItemView;
@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) UIActionSheet * actionSheet;
@property (strong, nonatomic) UIImagePickerController * imagePicker;
@property (strong, nonatomic) StoreEntityList * entities;
@end
