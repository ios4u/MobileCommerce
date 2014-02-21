//
//  CreatePhotoView.h
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-21.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCImageView.h"

@protocol CreatePhotoViewDelegate <NSObject>

- (void)TapPhotoView:(id)sender;

@end

@interface CreatePhotoView : UIView <MCImageViewDelegate>

@property (weak, nonatomic) id <CreatePhotoViewDelegate> delegate;
@property (nonatomic, strong) MCImageView * photoView;

- (void)setPhotoWithImage:(UIImage *)image;
@end
