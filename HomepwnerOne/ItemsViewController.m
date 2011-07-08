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


- (void)editingButtonPressed:(id)sender
{
    // If we are currently inediting mode...
    if([self isEditing])
    {
        // Change text of button to inform user of state...
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        // Turn Off editing mode...
        [self setEditing:NO animated:YES];
    }
    else
    {
        // Change text of button to inform user of state...
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        // Enter editing mode...
        [self setEditing:YES animated:YES];
    }
}


- (UIView *)headerView
{
    if (headerView)
        return headerView;
    
    // Create a UIButton object, simple rounded rec style...
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // Set the title of this button to "Edit"...
    [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    
    // How wide is the screen?...
    float w = [[UIScreen mainScreen] bounds].size.width;
    
    // Create a rectangle for the button...
    CGRect editButtonFrame = CGRectMake(8.0, 8.0, w - 18.0, 30);
    [editButton setFrame:editButtonFrame];
    
    // When this button is tapped, send the message
    // editingButtonPressed: to this instance of ItemsViewController...
    [editButton addTarget:self 
                   action:@selector(editingButtonPressed:) 
         forControlEvents:UIControlEventTouchUpInside];
    
    // Create a rectangle for the headerView that will contain the button...
    CGRect headerViewFrame = CGRectMake(0, 0, w, 48);
    headerView = [[UIView alloc] initWithFrame:headerViewFrame];
    
    // Add buttion to the headerView's view hierarchy...
    [headerView addSubview:editButton];
    
    return headerView;
    
}


/*
 NOTE: This method must be implemented BELOW the - (UIView *)headerView method above or warnings
    are issued by xCode and the compiler.  This is caused because 'headerView' is not initially 
    defined  by the compiler or xCode. The application WILL build and run normally without moving 
    the code.  The warning is simply a nuisance that can be resolved by moving the code.  
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	return [self headerView];
}


/*
 NOTE: This method must be implemented BELOW the - (UIView *)headerView method above or warnings  
    are issued by xCode and the compiler.  This is caused because 'headerView' is not initially 
    defined  by the compiler or xCode. The application WILL build and run normally without moving 
    the code.  The warning is simply a nuisance that can be resolved by moving the code.  
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [[self headerView] frame].size.height;
}



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
