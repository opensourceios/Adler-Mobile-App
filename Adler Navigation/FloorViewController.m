//
//  FloorViewController.m
//  Adler Navigation
//
//  Created by Rohan Shah on 3/11/14.
//  Copyright (c) 2014 Adler Planetarium. All rights reserved.
//

#import "FloorViewController.h"
#import "EachFloorViewController.h"

@interface FloorViewController ()

@end

@implementation FloorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //Retrieve information form each dictionary in array and display them in labels.
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Upper Level";
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"Mid Level";
    }
    
    if (indexPath.row == 2) {
        cell.textLabel.text = @"Lower Level";
    }
    
    if (indexPath.row == 3) {
        cell.textLabel.text = @"Star Level";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"EachFloorView" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Sends data to the view controller to display details of the tapped individual.
    if ([[segue identifier] isEqualToString:@"EachFloorView"])
    {
        EachFloorViewController *ViewController = [segue destinationViewController];
        ViewController.sourceORdestination = _sourceORDestination;
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        if (myIndexPath.row == 0) {
            ViewController.currentFloor = @"top";
        }
        if (myIndexPath.row == 1) {
            ViewController.currentFloor = @"mid";
        }
        if (myIndexPath.row == 2) {
            ViewController.currentFloor = @"lower";
        }
        if (myIndexPath.row == 3) {
            ViewController.currentFloor = @"star";
        }
        
    }
}

@end
