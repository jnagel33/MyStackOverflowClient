//
//  SideMenuTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "SideMenuTableViewCell.h"
#import "StackOverFlowStyleKit.h"

@implementation SideMenuTableViewCell

- (void)awakeFromNib {
  self.backgroundColor = [StackOverFlowStyleKit lightGray];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
