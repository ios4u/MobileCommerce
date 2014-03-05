//
//  MyStoreController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "MyStoreController.h"
//#import "StoreEntityList.h"
#import "StoreList.h"
//#import "StoreHeaderView.h"
#import "StoreCell.h"
#import "StoreController.h"

//#import "AddEntityController.h"

@interface MyStoreController ()

@end

@implementation MyStoreController

@synthesize stores = _stores;
//@synthesize headerView = _headerView;
@synthesize rightBarBtn = _rightBarBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _stores = [[StoreList alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_stores removeTheObserverWithObject:self];
}

- (void)loadView
{
    [super loadView];
    
//    _headerView = [[StoreHeaderView alloc] initWithFrame:CGRectMake(0.0, 0., WIDTH, 200)];
    
//    self.tableview.tableHeaderView = _headerView;
    self.tableview.rowHeight = 80.;
    
    _rightBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarBtnAction:)];
    self.navigationItem.rightBarButtonItem = _rightBarBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = NSLocalizedStringFromTable(@"my store", @"MC", nil);
    [_stores addTheObserverWithObject:self];
    [_stores load];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBarBtnAction:(id)sender
{
//    [[OpenCenterController sharedOpenCenterController] openAddItemController];
    [[OpenCenterController sharedOpenCenterController] openCreateStoreControllerWithStores:_stores];
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_stores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifer = @"UserStoreCell";
    StoreCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    if (cell == nil) {
        cell = [[StoreCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifer];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

    }
    
    Store * _store = [_stores objectAtIndex:indexPath.row];
    cell.store = _store;

    return cell;
}

#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Store * _store = [_stores objectAtIndex:indexPath.row];
    StoreController * _controller = [[StoreController alloc] init];
    _controller.store = _store;
    [self.navigationController pushViewController:_controller animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - handle kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
//    NSLog(@"key %@", keyPath);
    if ([keyPath isEqualToString:@"isLoading"]) {
        if( ![[change valueForKeyPath:@"new"] integerValue])
        {
            [self.tableview reloadData];
        }
    }
    if ([keyPath isEqualToString:@"isCreating"]) {
        if (![[change valueForKeyPath:@"new"] integerValue]) {
            [self.tableview reloadData];
        }
    }
}

@end
