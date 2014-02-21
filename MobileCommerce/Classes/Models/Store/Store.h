//
//  Store.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
{
    BOOL isCreating;
}

@property (strong, nonatomic) NSError * error;
@property (readonly) NSUInteger store_id;
@property (strong, nonatomic) NSString * store_name;
@property (strong, nonatomic) NSString * address;
@property (strong, nonatomic) NSString * tel;
@property (strong, nonatomic) NSString * desc;
@property (unsafe_unretained, nonatomic) NSURL * image_url;

- (id)initWithAttributes:(NSDictionary *)attributes;

- (void)addTheObserverWithObj:(id)obj;
- (void)removeTheObserverWithObj:(id)obj;


//- (void)loadStore;

//- (void)createWithName:(NSString *)name Address:(NSString *)address;
- (void)createWithName:(NSString *)name Address:(NSString *)address Image:(UIImage *)image;

@end
