//
//  EntityController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "ListController.h"

@class EntityList;

@interface EntityController : ListController;

@property (strong, nonatomic) EntityList * data;

@end
