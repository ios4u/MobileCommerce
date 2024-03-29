//
//  CreateStoreController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-18.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#import "CreateStoreController.h"
#import "Store.h"
#import "StoreList.h"


@interface CreateStoreController ()

@end

@implementation CreateStoreController

@synthesize store = _store;
@synthesize stores = _stores;
@synthesize storenameTF = _storenameTF;
@synthesize addressTF = _addressTF;

@synthesize tableView = _tableView;
@synthesize imagePicker = _imagePicker;
@synthesize actionSheet = _actionSheet;
@synthesize photoView = _photoView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        _store = [[Store alloc] init];
//        _stores = [[StoreList alloc] ini]
    }
    return self;
}

- (void)dealloc
{
    [_stores removeTheObserverWithObject:self];
}

- (void)loadView
{
    self.title = @"创建一个新的店铺";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view = _tableView;
    
    _photoView = [[CreatePhotoView alloc] initWithFrame:CGRectMake(0., 0., 200, 160.)];
    _photoView.delegate = self;
    _tableView.tableHeaderView = _photoView;
    
    _actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:NSLocalizedStringFromTable(@"cancel", kLocalization, nil) destructiveButtonTitle:nil otherButtonTitles:NSLocalizedStringFromTable(@"take photo", kLocalization, nil), NSLocalizedStringFromTable(@"choose", kLocalization, nil), nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [_store addTheObserverWithObj:self];
    
    UIBarButtonItem * cancelBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBarBtnAction:)];
    self.navigationItem.leftBarButtonItem = cancelBarBtn;
}

- (void)setStores:(StoreList *)stores
{
    _stores = stores;
    [_stores addTheObserverWithObject:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 2;
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString * CellIdentifier = @"StoreCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UITextField * tf;
    if (indexPath.section == 0) {

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
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
            cell.textLabel.text = NSLocalizedStringFromTable(@"store name", kLocalization, nil);
            tf.placeholder = NSLocalizedStringFromTable(@"store name", kLocalization, nil);
            tf.keyboardType = UIKeyboardTypeAlphabet;
            _storenameTF = tf;
            break;
        case 1:
            cell.textLabel.text = NSLocalizedStringFromTable(@"address", kLocalization, nil);
            tf.placeholder = NSLocalizedStringFromTable(@"address", kLocalization, nil);
            
            _addressTF = tf;
            break;
        default:
            break;
    }
    
    tf.frame = CGRectMake(120, 8, 170, 30);
    } else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.text = NSLocalizedStringFromTable(@"done", kLocalization, nil);
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return cell;

}

#pragma mark - tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        [SVProgressHUD show];
        [_stores createWithName:_storenameTF.text Address:_addressTF.text Image:[_photoView PhotoImage]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - button action 

- (void)cancelBarBtnAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Action Sheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    switch (buttonIndex) {
        case 0:
        {
            
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                [_imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            }
            //            imagePicker.delegate = self;
            [self presentViewController:_imagePicker animated:YES completion:nil];
        }
            break;
        case 1:
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
            {
                [_imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            }
            //            imagePicker.delegate = self;
            [self presentViewController:_imagePicker animated:YES completion:nil];
        }
            break;
        default:
            //            return;
            break;
    }
    
}

#pragma mark - Create Photo View Delegate
- (void)TapPhotoView:(id)sender
{
    [_actionSheet showInView:self.view];
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [_photoView setPhotoWithImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - handle kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"isCreating"]) {
//        if ([change ])
        if( ![[change valueForKeyPath:@"new"] integerValue])
        {
            if (!_stores.error) {
                [SVProgressHUD showSuccessWithStatus:NSLocalizedStringFromTable(@"done", kLocalization, nil)];
                
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
}

@end