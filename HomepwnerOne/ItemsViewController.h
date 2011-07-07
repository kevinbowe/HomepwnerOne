//
//  ItemsViewController.h
//  HomepwnerOne
//
//  Created by Kevin Bowe on 7/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 This class uses the UIViewController class as the seed based on the text.  The text
 explisitly recommended NOT selecting the UITableViewController class for the seed. 
 */

@interface ItemsViewController : UITableViewController /*UIViewController*/ {
    NSMutableArray *possessions;
}

@end
