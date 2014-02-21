//
//  CreateStoreController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-18.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "ListController.h"
#import "CreatePhotoView.h"

@class Store;

@interface CreateStoreController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UITableViewDelegate, UITableViewDataSource, CreatePhotoViewDelegate>

@property (strong, nonatomic) Store * store;

@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) UIImagePickerController * imagePicker;
@property (strong, nonatomic) UIActionSheet * actionSheet;
@property (strong, nonatomic) CreatePhotoView * photoView;
@property (strong, nonatomic) UITextField * storenameTF;
@property (strong, nonatomic) UITextField * addressTF;
//@property ()

@end
