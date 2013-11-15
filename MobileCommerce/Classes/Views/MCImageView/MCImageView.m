//
//  MCImageView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-15.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MCImageView.h"

@implementation MCImageView

@synthesize delegate = _delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_delegate && [_delegate respondsToSelector:@selector(TapImageView:)]) {
        [_delegate TapImageView:self];
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
