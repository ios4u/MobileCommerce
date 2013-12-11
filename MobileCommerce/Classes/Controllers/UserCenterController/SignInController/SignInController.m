//
//  SignInController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-12-2.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "SignInController.h"

@interface SignInController ()

@end

@implementation SignInController

@synthesize tableView = _tableView;
@synthesize usernameTF = _usernameTF;
@synthesize passwdTF = _passwdTF;
@synthesize signInBarBtn = _signInBarBtn;

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
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view = _tableView;
    
    _signInBarBtn = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedStringFromTable(@"signin", kLocalization, nil) style:UIBarButtonItemStylePlain target:self action:@selector(signInBarBtnAction:)];
    self.navigationItem.rightBarButtonItem = _signInBarBtn;
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

#pragma mark - tableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifer = @"ContentInCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    UITextField * tf;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
        tf = [[UITextField alloc] initWithFrame:CGRectZero];
        tf.autocorrectionType = UITextAutocorrectionTypeNo;
        tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        tf.adjustsFontSizeToFitWidth = YES;
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.contentView addSubview:tf];
    }
    
    return cell;
}

#pragma mark - button action
- (void)signInBarBtnAction:(id)sender
{

}

@end
