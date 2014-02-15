//
//  EntityController.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "ListController.h"
#import "DropListController.h"
@class EntityList;

@interface EntityController : ListController <UISearchBarDelegate, PassValueDelegate>;

@property (strong, nonatomic) EntityList * entities;
@property (strong, nonatomic) UISearchBar * searchBar;
@property (strong, nonatomic) DropListController * dropList;
@end
