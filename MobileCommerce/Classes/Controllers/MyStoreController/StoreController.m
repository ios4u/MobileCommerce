//
//  StoreController.m
//  MobileCommerce
//
//  Created by 谢 家欣 on 14-2-20.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "StoreController.h"
#import "Store.h"
#import "EntityList.h"

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
        _entities = [[EntityList alloc] init];
    }
    return self;
}

- (void)dealloc
{
    
}

- (void)loadView
{
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    self.view = _tableview;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = _store.store_name;
    
    [_entities load];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifer = @"EntityCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    return cell;
}

#pragma mark - tabelview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - handle kvo 
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{

}

@end
