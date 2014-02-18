//
//  MyStoreController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MyStoreController.h"
#import "StoreEntityList.h"
#import "StoreHeaderView.h"
//#import "AddEntityController.h"

@interface MyStoreController ()

@end

@implementation MyStoreController

@synthesize entities = _entities;
@synthesize headerView = _headerView;
@synthesize rightBarBtn = _rightBarBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _entities = [[StoreEntityList alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_entities removeTheObserverWithObject:self];
}

- (void)loadView
{
    [super loadView];
    
    _headerView = [[StoreHeaderView alloc] initWithFrame:CGRectMake(0.0, 0., WIDTH, 200)];
    
    self.tableview.tableHeaderView = _headerView;
    
    _rightBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarBtnAction:)];
    self.navigationItem.rightBarButtonItem = _rightBarBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = NSLocalizedStringFromTable(@"my store", @"MC", nil);
    [_entities addTheObserverWithObject:self];
    [_entities load];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBarBtnAction:(id)sender
{
//    [[OpenCenterController sharedOpenCenterController] openAddItemController];
    [[OpenCenterController sharedOpenCenterController] openCreateStoreController];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"key %@", keyPath);
}

@end
