//
//  MainMenuTableViewController.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideMenuSelectionDelegate.h"


@interface SideMenuTableViewController : UITableViewController

@property(weak, nonatomic)id<SideMenuSelectionDelegate> delegate;

@end
