//
//  MenuHeaderController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-12.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MenuHeaderController.h"

@interface MenuHeaderController ()

@end

@implementation MenuHeaderController

@synthesize headerView = _headerView;

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
    _headerView = [[MenuHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, WIDTH, 80.)];
    _headerView.delegate = self;
    self.view = _headerView;
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

#pragma mark - MenuHeaderView Delegate
- (void)TapSignInOrUp:(id)sender
{
    DLOG(@"sign in or up");
    [[OpenCenterController sharedOpenCenterController] openLoginController];
}

- (void)gotoUserProfileView:(id)sender
{
    DLOG(@"go to");
}

@end
