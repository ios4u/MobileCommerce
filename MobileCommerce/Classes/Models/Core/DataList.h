//
//  DataList.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataList : NSObject {
    BOOL isLoading;
    BOOL isRefreshing;
}

@property (readwrite) NSInteger index;
@property (strong, nonatomic) NSMutableArray * dataList;

- (NSInteger)count;
- (void)load;
- (void)refresh;

- (id)objectAtIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSInteger)index;

- (void)addTheObserverWithObject:(id)obj;
- (void)removeTheObserverWithObject:(id)obj;

@end
