//
//  EntityController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-11.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "EntityController.h"
#import "EntityList.h"
#import "EntityCell.h"

@interface EntityController ()

@end

@implementation EntityController

@synthesize entities = _entities;
@synthesize searchBar = _searchBar;
@synthesize dropList = _dropList;

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
    [_entities removeTheObserverWithObject:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedStringFromTable(@"entity", @"MC", nil);
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0., 0., WIDTH, 0.)];
    _searchBar.placeholder = NSLocalizedStringFromTable(@"search", @"basechem", nil);
    _searchBar.delegate = self;
    [_searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_searchBar sizeToFit];
    self.tableview.tableHeaderView = _searchBar;
    
    _dropList = [[DropListController alloc] initWithStyle:UITableViewStylePlain];
    _dropList.delegate = self;
    [_dropList setDDListHidden:YES Animate:NO];
    
    [self.view addSubview:_dropList.view];
    [_entities addTheObserverWithObject:self];
//    [_entities load];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL) active
{
    self.tableview.allowsSelection = !active;
    self.tableview.scrollEnabled = !active;
    [searchBar setShowsCancelButton:active animated:YES];
}

#pragma mark - search bar delegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    [self searchBar:searchBar activate:NO];
    [_dropList setDDListHidden:YES Animate:YES];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self searchBar:searchBar activate:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    DLOG(@"%@", searchText);
    
    if ([searchText length] != 0) {
        _dropList.searchText = searchText;
        [_dropList setDDListHidden:NO Animate:YES];
    } else {
        [_dropList setDDListHidden:YES Animate:YES];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_dropList setDDListHidden:YES Animate:YES];
}

#pragma mark - Table View datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_entities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ListCell";
    EntityCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[EntityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}

#pragma mark - PassValueDelegate
- (void)passValue:(NSString *)value
{
    if (value) {
        _searchBar.text = value;
        [self searchBarSearchButtonClicked:_searchBar];
        [_dropList setDDListHidden:YES Animate:YES];
    }
}


#pragma mark - handle kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{

}

@end
