//
//  MyStoreController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MyStoreController.h"
//#import "StoreHeaderView.h"
//#import "AddEntityController.h"

@interface MyStoreController ()

@end

@implementation MyStoreController

//@synthesize headerView = _headerView;
@synthesize rightBarBtn = _rightBarBtn;

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
    [super loadView];
    
    _rightBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarBtnAction:)];
    
    self.navigationItem.rightBarButtonItem = _rightBarBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = NSLocalizedStringFromTable(@"my store", @"MC", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBarBtnAction:(id)sender
{
    [[OpenCenterController sharedOpenCenterController] openAddItemController];
}

@end
