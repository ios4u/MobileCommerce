//
//  DataList.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "DataList.h"

@implementation DataList

@synthesize index = _index;
@synthesize dataList = _dataList;

- (id)init
{
    self = [super init];
    if (self) {
        _index = 0;
        _dataList = [[NSMutableArray alloc] initWithCapacity:0];
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isLoading"];
        [self setValue:[NSNumber numberWithBool:NO] forKey:@"isRefreshing"];
    }
    
    return self;
}

- (NSInteger)count
{
    return [_dataList count];
}

- (void)load
{

}

- (void)refresh
{

}

- (id)objectAtIndex:(NSUInteger)index
{
    return [_dataList objectAtIndex:index];
}

- (void)removeObjectAtIndex:(NSInteger)index
{
    [_dataList removeObjectAtIndex:index];
}

- (void)addTheObserverWithObject:(id)obj
{
    [self addObserver:obj forKeyPath:@"isLoading" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:obj forKeyPath:@"isRefreshing" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeTheObserverWithObject:(id)obj
{
    [self removeObserver:obj forKeyPath:@"isLoading"];
    [self removeObserver:obj forKeyPath:@"isRefreshing"];
}

@end
