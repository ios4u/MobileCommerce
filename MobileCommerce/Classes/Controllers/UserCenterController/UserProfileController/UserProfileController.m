//
//  UserProfileController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-18.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "UserProfileController.h"
#import "CodeVerifiedController.h"

@interface UserProfileController ()

@end

@implementation UserProfileController

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
    self.title = [[UserCenter sharedUserCenter] username];

    UIBarButtonItem * cancelBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBarBtnAction:)];
    self.navigationItem.leftBarButtonItem = cancelBarBtn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview datasource
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
    static NSString *CellIdentifier = @"UserProfileCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = NSLocalizedStringFromTable(@"username", kLocalization, nil);
                cell.detailTextLabel.text = [[UserCenter sharedUserCenter] username];
            } else {
                cell.textLabel.text = NSLocalizedStringFromTable(@"phone number", kLocalization, nil);
                cell.detailTextLabel.text = [[UserCenter sharedUserCenter] mobile];
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }

        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        CodeVerifiedController * controller = [[CodeVerifiedController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - barbtn action

- (void)cancelBarBtnAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
