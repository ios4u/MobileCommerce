//
//  StoreCell.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-3-2.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;

@interface StoreCell : UITableViewCell

@property (strong, nonatomic) Store * store;

@property (strong, nonatomic) UIImageView * storeImageView;

@end
