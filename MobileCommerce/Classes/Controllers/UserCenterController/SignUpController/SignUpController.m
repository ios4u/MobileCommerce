//
//  SignUpController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-16.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "SignUpController.h"
#import "CodeVerifiedController.h"

@interface SignUpController ()

@end

@implementation SignUpController

//@synthesize signUpView = _signUpView;
@synthesize tableView = _tableView;
@synthesize SignUpBarBtn = _SignUpBarBtn;
@synthesize usernameTF = _usernameTF;
@synthesize passwdTF = _passwdTF;
@synthesize mobilePhoneTF = _mobilePhoneTF;

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


#pragma mark - tableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = NSLocalizedStringFromTable(@"username", kLocalization, nil);
            tf.keyboardType = UIKeyboardTypeNumberPad;
            tf.placeholder = NSLocalizedStringFromTable(@"username", kLocalization, nil);
            _usernameTF = tf;
        }
            break;
        case 1:
        {
            cell.textLabel.text = NSLocalizedStringFromTable(@"password", kLocalization, nil);
            tf.secureTextEntry = YES;
            tf.keyboardType = UIKeyboardTypeAlphabet;
            tf.placeholder = NSLocalizedStringFromTable(@"password", kLocalization, nil);
            tf.returnKeyType = UIReturnKeyGo;
            _passwdTF = tf;
        }
            break;
        case 2:
        {
            cell.textLabel.text = NSLocalizedStringFromTable(@"phone number", kLocalization, nil);
            tf.secureTextEntry = YES;
            tf.keyboardType = UIKeyboardTypeAlphabet;
            tf.placeholder = NSLocalizedStringFromTable(@"phone number", kLocalization, nil);
            tf.returnKeyType = UIReturnKeyGo;
            _mobilePhoneTF = tf;
        }
            break;
        default:
            break;
    }
    tf.frame = CGRectMake(120, 8, 170, 30);
    tf.delegate = self;
    return cell;
}

#pragma mark - table view delegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (indexPath.section == 1) {
//        [[UserCenter sharedUserCenter] signUpWithUsername:_usernameTF.text Passwd:_passwdTF.text Phone:_mobilePhoneTF.text];
//        
//        CodeVerifiedController * controller = [[CodeVerifiedController alloc] init];
//        [self.navigationController pushViewController:controller animated:YES];
//    }
}

@end
