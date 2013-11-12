//
//  HeaderView.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        if(OSVersionIsAtLeastiOS7()){
            [self setBackgroundColor:[UIColor colorWithRed:110./255.0
                                                     green:113.0/255.0
                                                      blue:115.0/255.0
                                                     alpha:1.0]];
        }
        else {
            [self setBackgroundColor:[UIColor colorWithRed:77.0/255.0
                                                     green:79.0/255.0
                                                      blue:80.0/255.0
                                                     alpha:1.0]];
        }
    }
    return self;
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
