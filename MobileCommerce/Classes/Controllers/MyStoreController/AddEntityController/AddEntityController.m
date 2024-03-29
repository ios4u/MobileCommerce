//
//  AddEntityController.m
//  MobileCommerce
//
//  Created by 谢家欣 on 13-11-14.
//  Copyright (c) 2013年 谢家欣. All rights reserved.
//

#import "AddEntityController.h"
#import "StoreEntityList.h"
#import "Store.h"
//#import "HttpRequest.h"

@interface AddEntityController ()

@end

@implementation AddEntityController
{
@private
    UIImageView * _itemImageV;
}

@synthesize addItemView = _addItemView;
@synthesize tableView = _tableView;
@synthesize imagePicker = _imagePicker;
@synthesize actionSheet = _actionSheet;
@synthesize itemnameTF = _itemnameTF;
@synthesize priceTF = _priceTF;
@synthesize descTF = _descTF;
@synthesize rateTF = _rateTF;

@synthesize entities = _entities;
@synthesize stroe = _stroe;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        _entities = [[StoreEntityList alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_entities removeTheObserverWithObject:self];
}

- (void)setEntities:(StoreEntityList *)entities
{
    _entities = entities;
    
}

- (void)loadView
{
    _addItemView = [[AddItemView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, 168)];
    _addItemView.delegate = self;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0., 0., WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableHeaderView = _addItemView;
    self.view = _tableView;
    
    _actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:NSLocalizedStringFromTable(@"cancel", kLocalization, nil) destructiveButtonTitle:nil otherButtonTitles:NSLocalizedStringFromTable(@"take photo", kLocalization, nil), NSLocalizedStringFromTable(@"choose", kLocalization, nil), nil];
    
//    [_addItemView addSubview:_actionSheet];
    
    UIBarButtonItem * cancelBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissModalViewControllerAnimated:)];
    UIBarButtonItem * doneBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBarBtnAction:)];
    
    self.navigationItem.leftBarButtonItem = cancelBarBtn;
    self.navigationItem.rightBarButtonItem = doneBarBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_entities addTheObserverWithObject:self];
	// Do any additional setup after loading the view.
}

- (void)setStroe:(Store *)stroe
{
    _stroe = stroe;
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
    return 4;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 88.;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if (indexPath.section == 0) {
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
        tf.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.contentView addSubview:tf];
    }
    
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = NSLocalizedStringFromTable(@"item name", kLocalization, nil);
            tf.keyboardType = UIKeyboardTypeAlphabet;
            tf.placeholder = NSLocalizedStringFromTable(@"item name", kLocalization, nil);
            tf.returnKeyType = UIReturnKeyNext;
            _itemnameTF = tf;
            
//            _usernameTF = tf;
        }
            break;
        case 1:
        {
            cell.textLabel.text = NSLocalizedStringFromTable(@"price", kLocalization, nil);
//            tf.secureTextEntry = YES;
            tf.keyboardType = UIKeyboardTypeAlphabet;
            tf.placeholder = NSLocalizedStringFromTable(@"price", kLocalization, nil);
            tf.returnKeyType = UIReturnKeyNext;
//            _passwdTF = tf;
            _priceTF = tf;
        }
            break;
        case 2:
        {
            cell.textLabel.text = NSLocalizedStringFromTable(@"desc", kLocalization, nil);
//            tf.secureTextEntry = YES;
            tf.keyboardType = UIKeyboardTypeAlphabet;
            tf.placeholder = NSLocalizedStringFromTable(@"desc", kLocalization, nil);
            tf.returnKeyType = UIReturnKeyNext;
            _descTF = tf;
        }
            break;
        case 3:
        {
            cell.textLabel.text = NSLocalizedStringFromTable(@"rate", kLocalization, nil);
            tf.keyboardType = UIKeyboardTypeAlphabet;
            tf.placeholder = @"0.0";
            tf.returnKeyType = UIReturnKeyGo;
            _rateTF = tf;
        }
            break;
        default:
            break;
    }
    tf.frame = CGRectMake(120, 8, 170, 30);
    //        [tf addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
//    tf.delegate = self;
    
    return cell;
}

#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    DLOG(@"text %@", [textField c]);
//    if (textField == _itemnameTF) {
//        DLOG(@"okokoko");
//        [UIView an]
        [_tableView setContentOffset:CGPointMake(0., 20.) animated:YES];
//    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _rateTF) {
        [self doneBarBtnAction:nil];
    } else if (textField == _itemnameTF) {
        [_priceTF becomeFirstResponder];
    } else if (textField == _priceTF) {
        [_descTF becomeFirstResponder];
    } else {
        [_rateTF becomeFirstResponder];
    }
    return YES;
}

#pragma mark - button action
- (void)doneBarBtnAction:(id)sender
{
    [_tableView setContentOffset:CGPointMake(0., 0.) animated:YES];
    [SVProgressHUD show];
//    DLOG(@"name %@", _itemnameTF.text);
    [_entities createEntityWithStoreID:_stroe.store_id Image:_itemImageV.image Title:_itemnameTF.text Price:_priceTF.text Desc:_descTF.text Rate:_rateTF.text];
}

#pragma mark - add item view action

- (void)TapEntityImage:(id)sender
{
    _itemImageV = (UIImageView *)sender;
    [_actionSheet showInView:self.view];
}

#pragma mark - action sheet delegate
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


#pragma mark UIImagePickerControllerDelegate 
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    DLOG(@"%@", info);
    _itemImageV.image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - handle kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"isCreating"]) {
        if( ![[change valueForKeyPath:@"new"] integerValue] ) {
            if (!_entities.error) {
                [SVProgressHUD showSuccessWithStatus:NSLocalizedStringFromTable(@"done", kLocalization, nil)];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }

}

@end
