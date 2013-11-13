//
//  LoginController.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 13-11-13.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

@synthesize loginView = _loginView;
@synthesize dismissBarBtn = _dismissBarBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [[UserCenter sharedUserCenter] removeTheObserverWithObject:self];
}

- (void)loadView
{
    _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT)];
    _loginView.delegate = self;
    self.view = _loginView;
    
    _dismissBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissBarBtnAction:)];
    self.navigationItem.leftBarButtonItem = _dismissBarBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[UserCenter sharedUserCenter] addTheObserverWithObject:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button action
- (void)dismissBarBtnAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Login View Delegate
- (void)TapSignInWithUsername:(NSString *)username Passwd:(NSString *)passwd
{
    [[UserCenter sharedUserCenter] signInWithUsername:username Passwd:passwd];
}

- (void)TapSignUp
{

}

@end
