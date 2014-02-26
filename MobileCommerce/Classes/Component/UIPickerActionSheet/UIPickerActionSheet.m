//
//  UIPickerActionSheet.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-26.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "UIPickerActionSheet.h"

@implementation UIPickerActionSheet

@synthesize containerView = _containerView;
@synthesize sheet = _sheet;
@synthesize picker = _picker;
@synthesize items = _items;
@synthesize selectedItem = _selectedItem;


- (id)initForView:(UIView*)aView
{
    if (self = [super init])
    {
        self.containerView = aView;
        [self initSheetWithWidth:aView.bounds.size.width];
    }
    return self;
}

- (void)initSheetWithWidth:(CGFloat)aWidth
{
//    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    _sheet = [[UIActionSheet alloc] init];
    
    UIToolbar *toolbar = [[UIToolbar alloc]
                          initWithFrame:CGRectMake(0, 0, aWidth, 0)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    [toolbar sizeToFit];
    
    [toolbar setItems:@[
                        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(pickerSheetCancel:)],
                        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerSheetDone:)]
                        ]];
    
    _picker = [[UIPickerView alloc]
                            initWithFrame:CGRectMake(0, toolbar.bounds.size.height, aWidth, 0)];
    _picker.showsSelectionIndicator = YES;
    _picker.delegate = self;
    
    [_sheet addSubview:toolbar];
    [_sheet addSubview:_picker];
    
//    self.sheet = sheet;
//    self.picker = picker;
}

- (void)show:(NSArray*)aItems
{
    self.items = aItems;
    
    // Do not show if items are invalid...
    if (!self.items || self.items.count <= 0)
        return;
    
    [self.sheet showInView:self.containerView];
    
    // XXX: Kinda hacky, but seems to be the only way to make it display correctly.
    [self.sheet
     setBounds:CGRectMake(0, 0,
                          self.containerView.frame.size.width,
                          self.sheet.frame.size.height + 478.0)];
    
    // Reload and select first item
    [_picker reloadComponent:0];
    [_picker selectRow:0 inComponent:0 animated:NO];
    [_picker.delegate pickerView:_picker didSelectRow:0 inComponent:0];
}

#pragma mark - picker datasource
- (int)numberOfComponentsInPickerView:(UIPickerView*)aPickerView
{
    return 1;
}

- (int)pickerView:(UIPickerView*)aPickerView numberOfRowsInComponent:(NSInteger)aComponent
{
    return [_items count];
}

#pragma mark - picker delegate

#pragma mark - button action
- (void)pickerSheetCancel:(id)sender
{

}

- (void)pickerSheetDone:(id)sender
{

}


@end
