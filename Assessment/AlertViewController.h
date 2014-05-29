//
//  AlertViewController.h
//  Assessment
//
//  Created by BSA univ 1 on 26/05/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *DetailView;

- (IBAction)AlertClick:(id)sender;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *firstname;
@property (strong, nonatomic) IBOutlet UITextField *lastname;
@property (strong, nonatomic) IBOutlet UITextField *phoneno;

@property (strong, nonatomic) IBOutlet UITableView *tabledata;

@end
