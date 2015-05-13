//
//  QuestionsTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "QuestionsTableViewCell.h"
#import "Question.h"

@interface QuestionsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *checkmarkImageView;

@end

@implementation QuestionsTableViewCell

-(void)configureCell:(Question *)question {
  self.titleLabel.text = nil;
  self.tagsLabel.text = nil;
  self.createdAtLabel.text = nil;
  self.profileImageView.image = nil;
  self.checkmarkImageView.image = nil;
  
  self.titleLabel.text = question.title;
  self.tagsLabel.text = [question.tags componentsJoinedByString:@", "];
  self.createdAtLabel.text = question.createdAt;
  if (question.isAnswered) {
    self.checkmarkImageView.image = [UIImage imageNamed:@"CheckmarkStackOverflow"];
  }
}

@end
