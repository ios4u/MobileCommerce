//
//  StoreCell.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-3-2.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "StoreCell.h"
#import "Store.h"
#import "UIImageView+WebCache.h"

@implementation StoreCell

@synthesize storeImageView = _storeImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _storeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_storeImageView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStore:(Store *)store
{
    _store = store;
    [_storeImageView setImageWithURL:_store.image_url];
    self.textLabel.text = _store.store_name;
    self.detailTextLabel.text = _store.address;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _storeImageView.frame = CGRectMake(10., 10., 60., 60.);
    self.textLabel.frame = CGRectMake(80., 10., 200., 44.);
    self.detailTextLabel.frame = CGRectMake(80, 54, 200, 20);
    
}

@end
