//
//  LoginController.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 13-11-13.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "LoginController.h"
#import "SignUpController.h"

@interface LoginController ()

@end

@implementation LoginController

//@synthesize loginView = _loginView;
@synthesize tableView = _tableView;
@synthesize dismissBarBtn = _dismissBarBtn;
@synthesize forgetPasswdBtn = _forgetPasswdBtn;
@synthesize usernameTF = _usernameTF;
@synthesize passwdTF = _passwdTF;

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

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.view = _tableView;
    _dismissBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissBarBtnAction:)];
    self.navigationItem.leftBarButtonItem = _dismissBarBtn;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[UserCenter sharedUserCenter] addTheObserverWithObject:self];
    self.title = NSLocalizedStringFromTable(@"sign in or up", kLocalization, nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 88.;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return nil;
    }
    UIView * footerview = [[UIView alloc] initWithFrame:CGRectZero];
    //        footerview.backgroundColor = [UIColor redColor];
    _forgetPasswdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_forgetPasswdBtn setTitle:NSLocalizedStringFromTable(@"forget password", kLocalization, nil) forState:UIControlStateNormal];
    [_forgetPasswdBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _forgetPasswdBtn.titleLabel.font = [UIFont systemFontOfSize:16.];
    _forgetPasswdBtn.frame = CGRectMake(0., 10, WIDTH, 22);
    [_forgetPasswdBtn addTarget:self action:@selector(forgetPasswdBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [footerview addSubview:_forgetPasswdBtn];
    return footerview;
    //        return _forgetPasswdBtn;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * CellIdentifer = @"ContentInCell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
        UITextField * tf;
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
        
        //        [cell.contentView addSubview:tf];
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
        default:
            break;
    }
    tf.frame = CGRectMake(120, 8, 170, 30);
    //        [tf addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    tf.delegate = self;
    
    return cell;
    } else {
        static NSString * CellIdentifer = @"SignInActionCell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
        }
        if (indexPath.row == 0) {
            cell.textLabel.text = NSLocalizedStringFromTable(@"signin", kLocalization, nil);
        } else {
            cell.textLabel.text = NSLocalizedStringFromTable(@"signup", kLocalization, nil);
        }
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
    
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CLOG(@"okokokok");
    if (indexPath.section == 1) {
        [_tableView deselectRowAtIndexPath:indexPath animated:YES];
        if ([_usernameTF.text length] < 8 || [_passwdTF.text length] < 6) {
//            error_info = @"用户名或者密码不符合要求";
//            [SVProgressHUD showErrorWithStatus:error_info];
            return;
        }

//        switch (indexPath.row) {
//            case 0:
//            {
//                [_user loginWithUsername:_usernameTF.text Passwd:_passwdTF.text];
//            }
//                break;
//            case 1:
//            {
//                [_user registerWithUsername:_usernameTF.text Passwd:_passwdTF.text];
//            }
//                break;
//            default:
//                break;
//        }
    }

}


#pragma mark - button action
- (void)dismissBarBtnAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)forgetPasswdBtnAction:(id)sender
{

}


@end
