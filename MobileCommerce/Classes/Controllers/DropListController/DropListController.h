//
//  DropListController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-28.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassValueDelegate <NSObject>

- (void)passValue:(NSString *)value;

@end

@interface DropListController : UITableViewController

@property (weak, nonatomic) id <PassValueDelegate> delegate;
@property (strong, nonatomic) NSString * searchText;
@property (strong, nonatomic) NSString * selectedText;
@property (strong, nonatomic) NSMutableArray * resultList;

- (void)setDDListHidden:(BOOL)hidden Animate:(BOOL)animate;
@end
