//
//  DropListController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-28.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "DropListController.h"

@interface DropListController ()

@end

@implementation DropListController

@synthesize delegate = _delegate;
@synthesize searchText = _searchText;
@synthesize selectedText = _selectedText;
@synthesize resultList = _resultList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        _resultList = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.tableView.layer.borderWidth = .5;
    self.tableView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    _selectedText = nil;
    _searchText = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDDListHidden:(BOOL)hidden Animate:(BOOL)animate {
	NSInteger height = hidden ? 0. : 180.;
    if (animate){
        [UIView animateWithDuration:.2 animations:^{
            self.view.alpha = hidden ? 0 : 1;
            [self.view setFrame:CGRectMake(30, 36, 200, height)];
        }];
    } else {
        self.view.alpha = hidden ? 0 : 1;
        [self.view setFrame:CGRectMake(30, 36, 200, height)];
    }
}

- (void)setSearchText:(NSString *)searchText
{
    _searchText = searchText;
    DLOG(@"search %@", _searchText);
    [self updateData];
}

- (void)updateData {
	[_resultList removeAllObjects];
//    DLOG(@"search %@", _selectedText);
    [_resultList addObject:_searchText];
	for (int i = 1; i<10; i++) {
		[_resultList addObject:[NSString stringWithFormat:@"%@%d", _searchText, i]];
	}
	[self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_resultList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [_resultList objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Table View delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	return 30.;
}

@end
