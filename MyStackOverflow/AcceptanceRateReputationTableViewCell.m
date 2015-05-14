//
//  AcceptanceRateReputationTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "AcceptanceRateReputationTableViewCell.h"
#import "User.h"

@interface AcceptanceRateReputationTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *acceptanceRateLabel;

@property (weak, nonatomic) IBOutlet UILabel *reputationLabel;

@end

@implementation AcceptanceRateReputationTableViewCell

-(void)configureCell:(User *)user {
  self.acceptanceRateLabel.text = nil;
  if (user.acceptRate) {
    self.acceptanceRateLabel.text = [NSString stringWithFormat:@"%ld",(long)user.acceptRate];
  } else {
    self.acceptanceRateLabel.text = @"NA";
  }
  if (user.reputation) {
    self.reputationLabel.text = [NSString stringWithFormat:@"%ld",(long)user.reputation];
  } else {
    self.reputationLabel.text = @"0";
  }
}

@end
