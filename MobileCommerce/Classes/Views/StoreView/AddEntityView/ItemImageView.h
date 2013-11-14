//
//  ItemImageView.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ItemImageViewDelegate <NSObject>

- (void)TapImageView:(id)sender;

@end

@interface ItemImageView : UIImageView


@property (weak, nonatomic) id<ItemImageViewDelegate> delegate;
//@property (weak, nonatomic) SEL method;

@end
