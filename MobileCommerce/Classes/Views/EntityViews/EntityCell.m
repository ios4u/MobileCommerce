//
//  EntityCell.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-28.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "EntityCell.h"
#import "Entity.h"
#import "UIImageView+WebCache.h"

@implementation EntityCell

@synthesize entity = _entity;
@synthesize entityImageView = _entityImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _entityImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//        _entityImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_entityImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEntity:(Entity *)entity
{
    _entity = entity;
    [_entityImageView setImageWithURL:_entity.image_url];
    self.textLabel.text = _entity.name;
    self.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", _entity.price];
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(80., 10., 200, 44);
    _entityImageView.frame = CGRectMake(10., 10, 60., 60.);

    
}

@end
