//
//  SignUpController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-16.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "SignUpController.h"

@interface SignUpController ()

@end

@implementation SignUpController

@synthesize signUpView = _signUpView;

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
    _signUpView = [[SignUpView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT)];
    
    self.view = _signUpView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = NSLocalizedStringFromTable(@"signup", kLocalization, nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
