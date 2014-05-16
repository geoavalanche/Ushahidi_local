//
//  USHFieldViewController.m
//  App
//
//  Created by Cristiano Carducci on 13/05/14.
//  Copyright (c) 2014 Ushahidi. All rights reserved.
//

#import "USHFieldViewController.h"
#import <Ushahidi/CustomFieldTypeDetail.h>
#import "USHTableCellFactory.h"

typedef enum {
    TextFieldType = 1,
    TextAreaFieldType = 2,
    DateFieldType = 3,
    PasswordFieldType = 4,
    RadioFieldType = 5,
    CheckBoxFieldType = 6,
    DropDownFieldType = 7
} CustomFieldType;

@interface USHFieldViewController ()

@end

@implementation USHFieldViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _selected = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [_Back release];
    [_Reset release];
    [_selected release];
    [super dealloc];
}

#pragma mark  utility

- (NSInteger)getCount
{
    NSInteger count =[[_field.defaultvalue componentsSeparatedByString:@","] count];
    return count;
}

- (NSString*)getFieldValue:(NSUInteger)itemIndex
{
    NSArray *listItems = [_field.defaultvalue componentsSeparatedByString:@","];
    return [listItems objectAtIndex:itemIndex];
}

#pragma mark  table event

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self getCount];
    return count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *value =[self getFieldValue:indexPath.row];
    
    
    if (_field.type.intValue == 5 ){


        BOOL checked = true;
        if ( [_selected count] > 0 )
        {
            NSString *itemSselected =_selected[0];
            NSInteger indexInt = indexPath.row;
            NSString *itemS = [@(indexInt ) stringValue];
            if ( [itemS isEqualToString:itemSselected] )checked = false;
        }
        
        return [USHTableCellFactory customOptionBoxTableCellForTable:tableView
                                                          indexPath:indexPath
                                                           delegate:self
                                                               text:value
                                                            details:nil
                                                            checked:checked
                                                              color:Nil];
    }else if (_field.type.intValue == 6 ){
        BOOL checked = false;
        return [USHTableCellFactory customCheckBoxTableCellForTable:tableView
                                                          indexPath:indexPath
                                                           delegate:self
                                                               text:value
                                                            details:nil
                                                            checked:checked
                                                              color:Nil];
    }else if (_field.type.intValue == 7 ){
        BOOL checked = true;
        if ( [_selected count] > 0 )
        {
            NSString *itemSselected =_selected[0];
            NSInteger indexInt = indexPath.row;
            NSString *itemS = [@(indexInt ) stringValue];
            if ( [itemS isEqualToString:itemSselected] )checked = false;
        }
        return [USHTableCellFactory customComboBoxTableCellForTable:tableView
                                                          indexPath:indexPath
                                                           delegate:self
                                                               text:value
                                                            details:nil
                                                            checked:checked
                                                              color:Nil];
    }else{
        nil;
    }
    return nil;
}

#pragma mark  action

- (IBAction)BackEv:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)ResetEv:(id)sender {
    if (_field.type.intValue == 5 || _field.type.intValue == 7 ){
            [_selected removeAllObjects];
            [self.tableView reloadData];
    }
    
}

#pragma mark - USHCheckBoxTableCell

- (void) checkBoxChanged:(USHCheckBoxTableCell *)cell index:(NSIndexPath *)indexPath checked:(BOOL)checked {

    if (_field.type.intValue == 5 || _field.type.intValue == 7 ){
        
        if (_selected.count >0){
            [_selected removeAllObjects];
            NSInteger indexInt = indexPath.row;
            NSString *itemS = [@(indexInt ) stringValue];
            [_selected addObject:itemS];
            [self.tableView reloadData];
        }else{
            NSInteger indexInt = indexPath.row;
            NSString *itemS = [@(indexInt ) stringValue];
            [_selected addObject:itemS];
        }
    }
    if (_field.type.intValue == 6){

    }
}
@end