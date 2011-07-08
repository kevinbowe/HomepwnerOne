//
//  HomepwnerOneAppDelegate.h
//  HomepwnerOne
//
//  Created by Kevin Bowe on 7/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemsViewController;

@interface HomepwnerOneAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
    ItemsViewController *itemsViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
