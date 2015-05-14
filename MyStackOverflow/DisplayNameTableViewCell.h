//
//  DisplayNameTableViewCell.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class User;

@interface DisplayNameTableViewCell : UITableViewCell

-(void)configureCell:(User *)user;

@end
