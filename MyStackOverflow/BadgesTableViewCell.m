//
//  BadgesTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "BadgesTableViewCell.h"
#import "User.h"

@interface BadgesTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *goldBadgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *silverBadgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bronzeBadgeLabel;


@end

@implementation BadgesTableViewCell

-(void)configureCell:(User *)user {
  self.goldBadgeLabel.text = nil;
  self.silverBadgeLabel.text = nil;
  self.bronzeBadgeLabel.text = nil;
  NSNumber *goldCount = user.badgeCounts[@"gold"];
  NSNumber *silverCount = user.badgeCounts[@"silver"];
  NSNumber *bronzeCount = user.badgeCounts[@"bronze"];
  self.goldBadgeLabel.text = [NSString stringWithFormat:@"%@", goldCount];
  self.silverBadgeLabel.text = [NSString stringWithFormat:@"%@", silverCount];
  self.bronzeBadgeLabel.text = [NSString stringWithFormat:@"%@", bronzeCount];
  
}

@end
