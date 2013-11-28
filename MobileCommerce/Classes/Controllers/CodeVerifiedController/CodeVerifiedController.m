//
//  CodeVerifiedController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-27.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "CodeVerifiedController.h"


@interface CodeVerifiedController ()

@end

@implementation CodeVerifiedController

@synthesize verifiedView = _verifiedView;

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
//    [super loadView];
    _verifiedView = [[VerifiedView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT)];
    _verifiedView.delegate = self;
    
    self.title = NSLocalizedStringFromTable(@"verify", kLocalization, nil);
    
    self.view = _verifiedView;
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

#pragma mark - verifiedView delegate
- (void)TapCodeVerifiedWithCode:(NSString *)code
{
    DLOG(@"verified %@", code);
}

@end
