//
//  StoreController.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-20.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "StoreController.h"
#import "Store.h"
#import "StoreEntityList.h"
#import "EntityDetailController.h"
#import "EntityCell.h"
//#import "AddEntityController.h"

@interface StoreController ()

@end

@implementation StoreController

@synthesize store = _store;
@synthesize entities = _entities;
@synthesize tableview = _tableview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _entities = [[StoreEntityList alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_entities removeTheObserverWithObject:self];
}

- (void)loadView
{
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    self.view = _tableview;
    _tableview.rowHeight = 80.;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = _store.store_name;
    
    UIBarButtonItem * addBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBarBtnAction:)];
    self.navigationItem.rightBarButtonItem = addBarBtn;
    [_entities addTheObserverWithObject:self];
    [_entities loadWithStoreId:_store.store_id];
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
    return [_entities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifer = @"EntityCell";
    EntityCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    if (cell == nil) {
        cell = [[EntityCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifer];
    }
    Entity * entity = [_entities objectAtIndex:indexPath.row];
    cell.entity = entity;
//    cell.textLabel.text = entity.name;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", entity.price];
//    [cell.imageView setImageWithURL:entity.image_url];
    
    return cell;
}

#pragma mark - tabelview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Entity * _entity = [_entities objectAtIndex:indexPath.row];
    EntityDetailController * controller = [[EntityDetailController alloc] init];
    controller.entity = _entity;
    [self.navigationController pushViewController:controller animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - button action
- (void)addBarBtnAction:(id)sender
{
    [[OpenCenterController sharedOpenCenterController] openAddItemControllerWithStore:_store Entities:_entities];
}

#pragma mark - handle kvo 
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"isLoading"]) {
        if( ![[change valueForKeyPath:@"new"] integerValue])
        {
            [_tableview reloadData];
        }
    }
    if ([keyPath isEqualToString:@"isCreating"]) {
//        DLOG(@"create create OKOKOKO");
        if ( ![[change valueForKeyPath:@"new"] integerValue] ) {
//            DLOG(@"add ok add ok");
            [_tableview reloadData];
        }
    }
}

@end
