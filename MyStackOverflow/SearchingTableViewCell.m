//
//  SearchingTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/14/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "SearchingTableViewCell.h"

@interface SearchingTableViewCell ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation SearchingTableViewCell

- (void)awakeFromNib {
  [self.activityIndicator startAnimating];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
