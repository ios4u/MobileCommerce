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

- (void)dealloc
{
    [[UserCenter sharedUserCenter] removeTheObserverWithObject:self];
}

- (void)loadView
{
//    [super loadView];
    _verifiedView = [[VerifiedView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT)];
    _verifiedView.mobile = [[UserCenter sharedUserCenter] mobile];
    _verifiedView.delegate = self;
    
    self.title = NSLocalizedStringFromTable(@"verify", kLocalization, nil);
    
    self.view = _verifiedView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UserCenter sharedUserCenter] addTheObserverWithObject:self];
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
    [SVProgressHUD show];
    [[UserCenter sharedUserCenter] verifyCode:code];
}

- (void)TapSendSMSWithPhone:(NSString *)phone
{
    DLOG(@"send message %@", phone);
    [SVProgressHUD show];
    [[UserCenter sharedUserCenter] sendSMSWithPhone:phone];
}

#pragma mark - handel kvo 
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    DLOG(@"keypath %@", keyPath);
    if ([keyPath isEqualToString:@"isSendingSMS"])
    {
        if( ![[change valueForKeyPath:@"new"] integerValue])
        {
            [SVProgressHUD showSuccessWithStatus:NSLocalizedStringFromTable(@"done", kLocalization, nil)];
            _verifiedView.sendSMSBtn.enabled = NO;
        }
    }
    if ([keyPath isEqualToString:@"isVerifyCode"]) {
        if (![[change valueForKeyPath:@"new"]  integerValue]) {
//            _verifiedView.verfiedBtn.enabled = NO;
            [SVProgressHUD showSuccessWithStatus:NSLocalizedStringFromTable(@"done", kLocalization, nil)];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

@end
