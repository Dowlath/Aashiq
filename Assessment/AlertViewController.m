 //
//  AlertViewController.m
//  Assessment
//
//  Created by BSA univ 1 on 26/05/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import "AlertViewController.h"
#import "AppDelegate.h"
#import "Person.h"
@interface AlertViewController ()

{
    NSManagedObjectContext *context;
    NSArray * arrayofcontacts;
    AppDelegate * delegateobj;
    
    //context = [delegateobj managedObjectContext];
    
}


@end

@implementation AlertViewController



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrayofcontacts.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Person *info = [arrayofcontacts objectAtIndex:indexPath.row];
    
    cell.textLabel.text = info.firstname;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@",
                                 info.lastname, info.phoneno];
    
    return cell;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


- (void)viewDidLoad
{
    [_DetailView setHidden:YES];
    delegateobj=[[AppDelegate alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self firstname ]setDelegate:self];
    [[self lastname  ]setDelegate:self];
    [[self phoneno   ]setDelegate:self];
    [self.tabledata reloadData];
    [self fetch];
   

  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)AlertClick:(id)sender {
    
     [_DetailView setHidden:NO];

}

- (IBAction)save:(id)sender {
    
    NSEntityDescription *entitydesc = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
     NSManagedObject *newPerson = [[NSManagedObject alloc]initWithEntity:entitydesc insertIntoManagedObjectContext:context];
    
    [newPerson setValue:self.firstname.text forKey:@"firstname"];
    [newPerson setValue:self.lastname.text forKey:@"lastname"];
    [newPerson setValue:self.phoneno.text forKey:@"phoneno"];
    
    NSError *error;
    [context save:&error];
      [_DetailView setHidden:YES];
    [self.tabledata reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)fetch
{
    context=delegateobj.managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Person" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError * error = nil;
    
    arrayofcontacts= [context executeFetchRequest:fetchRequest error:&error];
    
}



- (IBAction)cancel:(id)sender {
    
   [_DetailView setHidden:YES];
  
    
    
}
@end
