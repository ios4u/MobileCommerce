//
//  UIImage+Helper.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-21.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)

- (NSString *)base4String
{
    NSData * data = [UIImagePNGRepresentation(self) base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return [NSString stringWithUTF8String:[data bytes]];
}

@end
