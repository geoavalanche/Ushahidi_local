//
//  USHCustomFieldSingleViewController.h
//  App
//
//  Created by Cristiano Carducci on 15/05/14.
//  Copyright (c) 2014 Ushahidi. All rights reserved.
//

#import <Ushahidi/Ushahidi.h>
#import <Ushahidi/USHTableViewController.h>
#import <Ushahidi/CustomFieldTypeDetail.h>
#import "USHTableCellFactory.h"
#import "USHFieldItem.h"

@interface USHCustomFieldSingleViewController : USHViewController

@property (retain, nonatomic) USHFieldItem *field;
@property (retain, nonatomic) NSMutableArray *selected;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *reset;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *back;
- (IBAction)resetev:(id)sender;
- (IBAction)backev:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *testo;

@end
