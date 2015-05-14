//
//  QuestionsTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "QuestionsTableViewCell.h"
#import "Question.h"
#import "ImageResizer.h"
#import "StackOverFlowStyleKit.h"
#import "Answer.h"

@interface QuestionsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *checkmarkImageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation QuestionsTableViewCell

-(void)configureCell:(Question *)question {
  self.titleLabel.text = nil;
  self.tagsLabel.text = nil;
  self.createdAtLabel.text = nil;
  self.profileImageView.image = nil;
  self.checkmarkImageView.image = nil;
  
  self.containerView.layer.cornerRadius = 10;
  
  self.titleLabel.text = question.title;
  self.tagsLabel.text = [question.tags componentsJoinedByString:@", "];
  self.createdAtLabel.text = question.createdAt;
  if (question.isAnswered) {
    self.checkmarkImageView.image = [UIImage imageNamed:@"CheckmarkStackOverflow"];
  }
  self.profileImageView.transform = CGAffineTransformMakeScale(0.7, 0.7);
  if (question.profileImage) {
    self.profileImageView.image = question.profileImage;
    self.profileImageView.layer.borderColor = [StackOverFlowStyleKit lightGray].CGColor;
    self.profileImageView.layer.borderWidth = 2.0;
    self.profileImageView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
      self.profileImageView.transform = CGAffineTransformMakeScale(1, 1);
      self.profileImageView.alpha = 1;
    }];
  }
}

-(void)configureCellAnswer:(Answer *)answer {
  self.titleLabel.text = nil;
  self.tagsLabel.text = nil;
  self.createdAtLabel.text = nil;
  self.profileImageView.image = nil;
  self.checkmarkImageView.image = nil;
  
  self.containerView.layer.cornerRadius = 10;
  
//  self.titleLabel.text = answer.title;
//  self.tagsLabel.text = [answer.tags componentsJoinedByString:@", "];
//  self.createdAtLabel.text = answer.createdAt;
//  if (question.isAnswered) {
//    self.checkmarkImageView.image = [UIImage imageNamed:@"CheckmarkStackOverflow"];
//  }
//  self.profileImageView.transform = CGAffineTransformMakeScale(0.7, 0.7);
//  if (answer.profileImage) {
//    self.profileImageView.image = question.profileImage;
//    self.profileImageView.layer.borderColor = [StackOverFlowStyleKit lightGray].CGColor;
//    self.profileImageView.layer.borderWidth = 2.0;
//    self.profileImageView.alpha = 0;
//    [UIView animateWithDuration:0.3 animations:^{
//      self.profileImageView.transform = CGAffineTransformMakeScale(1, 1);
//      self.profileImageView.alpha = 1;
//    }];
//  }
}

@end
