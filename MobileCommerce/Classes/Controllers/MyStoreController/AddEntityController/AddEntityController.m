//
//  AddEntityController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "AddEntityController.h"

@interface AddEntityController ()

@end

@implementation AddEntityController
{
@private
    UIImageView * _itemImageV;
}

@synthesize addItemView = _addItemView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
    }
    return self;
}

- (void)loadView
{
    _addItemView = [[AddItemView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT)];
    _addItemView.delegate = self;
    self.view = _addItemView;
    
    UIBarButtonItem * cancelBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissModalViewControllerAnimated:)];
    UIBarButtonItem * doneBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBarBtnAction:)];
    
    self.navigationItem.leftBarButtonItem = cancelBarBtn;
    self.navigationItem.rightBarButtonItem = doneBarBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button action
- (void)doneBarBtnAction:(id)sender
{
    
}

#pragma mark - add item view action
- (void)openPickerImager:(id)sender
{
    _itemImageV = (UIImageView *)sender;
    
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate 
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _itemImageV.image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

@end
