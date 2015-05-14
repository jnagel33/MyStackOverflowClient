//
//  Answer.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "Answer.h"
#import "User.h"

@implementation Answer

-(instancetype)initWithAnswerID:(NSInteger)answerID isaccepted:(BOOL)isAccepted score:(NSInteger)score profileImageURL:(NSString *)profileImageURL {
  if (self = [super init]) {
    _answerID = answerID;
    _isAccepted = isAccepted;
    _score = score;
    _profileImageURL = profileImageURL;
  }
 
  return self;
}

@end
