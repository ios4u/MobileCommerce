//
//  MCImageView.h
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-15.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MCImageViewDelegate <NSObject>

- (void)TapImageView:(id)sender;

@end

@interface MCImageView : UIImageView

@property (weak, nonatomic) id <MCImageViewDelegate> delegate;

@end
