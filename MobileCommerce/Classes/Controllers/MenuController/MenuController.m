//
//  MenuController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-8.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MenuController.h"
#import "MenuList.h"
#import "MMSideDrawerSectionHeaderView.h"
#import "MMSideDrawerTableViewCell.h"



@interface MenuController ()

@end

@implementation MenuController

@synthesize data = _data;
@synthesize tableView = _tableView;
@synthesize headerController = _headerController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _data = [[MenuList alloc] init];
    }
    return self;
}

- (void)loadView
{

//    [super loadView];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UIColor * tableViewBackgroundColor;
    if(OSVersionIsAtLeastiOS7()){
        tableViewBackgroundColor = [UIColor colorWithRed:110.0/255.0
                                                   green:113.0/255.0
                                                    blue:115.0/255.0
                                                   alpha:1.0];
    }
    else {
        tableViewBackgroundColor = [UIColor colorWithRed:77.0/255.0
                                                   green:79.0/255.0
                                                    blue:80.0/255.0
                                                   alpha:1.0];
    }
    [_tableView setBackgroundColor:tableViewBackgroundColor];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.view = _tableView;
    
    
    
    UIColor * barColor = [UIColor colorWithRed:161.0/255.0
                                         green:164.0/255.0
                                          blue:166.0/255.0
                                         alpha:1.0];
    if([self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)]){
        [self.navigationController.navigationBar setBarTintColor:barColor];
    }
    else {
        [self.navigationController.navigationBar setTintColor:barColor];
    }
    
    
    NSDictionary *navBarTitleDict;
    UIColor * titleColor = [UIColor colorWithRed:55.0/255.0
                                           green:70.0/255.0
                                            blue:77.0/255.0
                                           alpha:1.0];
    navBarTitleDict = @{NSForegroundColorAttributeName:titleColor};
    [self.navigationController.navigationBar setTitleTextAttributes:navBarTitleDict];
    
    _headerController = [[MenuHeaderController alloc] initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.tableHeaderView = _headerController.view;
	// Do any additional setup after loading the view.
    [_data load];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UserMenuCell";
    MMSideDrawerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MMSideDrawerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    Menu * menu = [_data objectAtIndex:indexPath.row];
    cell.textLabel.text = menu.title;
    return cell;

}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    MMSideDrawerSectionHeaderView * headerView;
//    if(OSVersionIsAtLeastiOS7()){
//        headerView =  [[MMSideDrawerSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 56.0)];
//    }
//    else {
//        headerView =  [[MMSideDrawerSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 23.0)];
//    }
//    [headerView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
//    [headerView setTitle:[tableView.dataSource tableView:tableView titleForHeaderInSection:section]];
//    return headerView;
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if(OSVersionIsAtLeastiOS7()){
//        return 56.0;
//    }
//    else {
//        return 23.0;
//    }
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 40.0;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.0;
//}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Menu * menu;
//    switch (indexPath.section) {
//        case 1:
//        {
//             menu = [_data objectAtShopLAtIndex:indexPath.row];
//        }
//            break;
//            
//        default:
//        {
//             menu = [_data objectAtUserLAtIndex:indexPath.row];
//        }
//            break;
//    }
    Menu * menu = [_data objectAtIndex:indexPath.row];
    if ([menu.title isEqualToString:self.mm_drawerController.centerViewController.title]) {
        [self.mm_drawerController  toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    } else {
        //                DLOG(@"menu  %@", menu.title);
        Class centerClass = NSClassFromString(menu.klass);
        UIViewController * controller = [[centerClass alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self.mm_drawerController setCenterViewController:nav withFullCloseAnimation:YES completion:nil];
    }
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
