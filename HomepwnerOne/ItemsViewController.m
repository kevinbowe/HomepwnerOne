//
//  ItemsViewController.m
//  HomepwnerOne
//
//  Created by Kevin Bowe on 7/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

/*
 The following methods were removed:
 
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 - (void)loadView
 - (void)viewDidLoad
 */

#import "ItemsViewController.h"
#import "Possession.h"


@implementation ItemsViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check for a resuable cell first, use that if it exists...
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    // If there is no reusable cell of this type, create a new one...
    if (!cell){
        // Set the UITableViewCell instance, with the default appearance...
        cell = [[[UITableViewCell alloc] 
                    initWithStyle:UITableViewCellStyleDefault 
                  reuseIdentifier:@"UITableViewCell"] 
                autorelease]; 
 }
    
    /*
     Replaced with the code block above.
     */
//    // Create an instance of UITableViewCell, with the default appearance...
//    UITableViewCell *cell  =
//    [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
//                            reuseIdentifier:@"UITableViewCell"] autorelease];
    
    // Set the text on the cell with the description of the possession
    // that is at the nth index of possessions, where n = row this cell
    // will appear in on the tableview...
    Possession *p = [possessions objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p description]];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [possessions count];
}


- (id)init
{
    // Call the superclass's designated initializer...
    [super initWithStyle:UITableViewStyleGrouped];
    
    // Create an array of 10 random possesion objects...
    possessions = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++)
    {
        [possessions addObject:[Possession randomPossession]];
    }
    return self;
}

- (id) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Removed
// #pragma mark - View lifecycle

#pragma mark Table view methods

- (void)dealloc
{
    [super dealloc];
}
@end
