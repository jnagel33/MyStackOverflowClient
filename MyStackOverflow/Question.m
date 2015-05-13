//
//  Question.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)init:(NSInteger)questionID withTitle:(NSString *)title andIsAnswered:(BOOL)isAnswered withTags:(NSArray *)tags AndProfileImageURL:(NSString *)profileImageURL AndCreatedAt:(NSString *)createdAt {
  if (self = [super init]) {
    _questionID = questionID;
    _title = title;
    _isAnswered = isAnswered;
    _tags = tags;
    _profileImageURL = profileImageURL;
    _createdAt = createdAt;
  
  }
  return self;
}

@end
