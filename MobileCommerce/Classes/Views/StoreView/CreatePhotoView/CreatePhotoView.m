//
//  CreatePhotoView.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-21.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "CreatePhotoView.h"

@implementation CreatePhotoView

@synthesize photoView = _photoView;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = kDefaultBackgroundColor;
        
        
        _photoView = [[MCImageView alloc] initWithFrame:CGRectZero];
        _photoView.backgroundColor = [UIColor redColor];
        _photoView.delegate = self;
        
        
        [self addSubview:_photoView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    _photoView.frame = CGRectMake(80., 20., 160, 120);
}


- (void)setPhotoWithImage:(UIImage *)image
{
    _photoView.image = image;
}


#pragma mark - ImageView Delegate

- (void)TapImageView:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapPhotoView:)]) {
        [_delegate TapPhotoView:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
