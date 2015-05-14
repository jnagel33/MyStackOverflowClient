//
//  DisplayNameTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "DisplayNameTableViewCell.h"
#import "User.h"

@interface DisplayNameTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *displayNameLabel;

@end

@implementation DisplayNameTableViewCell

-(void)configureCell:(User *)user {
  self.displayNameLabel.text = nil;
  self.displayNameLabel.text = user.displayName;
}

@end
