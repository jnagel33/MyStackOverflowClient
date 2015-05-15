//
//  StackOverflowJSONParser.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "StackOverflowJSONParser.h"
#import "Question.h"
#import "User.h"
#import "Answer.h"

@implementation StackOverflowJSONParser

+(NSArray *)parseSearchQuestionsFromData:(NSDictionary *)searchListInfo {
  NSMutableArray *questionsList = [[NSMutableArray alloc]init];
  NSArray *questions = searchListInfo[@"items"];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  for (NSDictionary *questionInfo in questions) {
    NSNumber *questionID = questionInfo[@"question_id"];
    NSString *title = questionInfo[@"title"];
    bool isAnswered = questionInfo[@"is_answered"];
    NSArray *tags = questionInfo[@"tags"];
    if (tags.count > 3) {
      tags = [tags subarrayWithRange:NSMakeRange(0, 3)];
    }
    NSDictionary *owner = questionInfo[@"owner"];
    NSString *profileImageURL = owner[@"profile_image"];
    NSNumber *createdAt = questionInfo[@"creation_date"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:createdAt.integerValue];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSString *link = questionInfo[@"link"];
    
    Question *question = [[Question alloc]init:questionID.integerValue withTitle:title andIsAnswered:isAnswered withTags:tags AndProfileImageURL:profileImageURL AndCreatedAt:dateString WithLink:link
                          ];
    [questionsList addObject:question];
  }
  return questionsList;
}

+(User *)parseUserInfoFromData:(NSDictionary *)userInfo {
  NSArray *items = userInfo[@"items"];
  NSNumber *accountID = items[0][@"account_id"];
  NSString *displayName = items[0][@"display_name"];
  NSNumber *reputation = items[0][@"reputation"];
  NSString *profileImageURL = items[0][@"profile_image"];
  NSNumber *acceptRate = items[0][@"accept_rate"];
  NSDictionary *badgeCounts = items[0][@"badge_counts"];
  
  
  User *user = [[User alloc]initWithAccountID:accountID.integerValue displayName:displayName reputation:reputation.integerValue acceptRate:acceptRate.integerValue profileImageURL:profileImageURL badgeCounts:badgeCounts];
  return user;
}

+(NSArray *)parseAnswerIDsFrom:(NSDictionary *)data {
  NSArray *items = data[@"items"];
  NSMutableArray *answerIDs = [[NSMutableArray alloc]init];
  for (NSDictionary *answerInfo in items) {
    NSNumber *answerID = answerInfo[@"answer_id"];
    NSLog(@"Answer ID: %@",answerID);
    [answerIDs addObject:answerID];
  }
  return answerIDs;
}

+(NSArray *)parseAnswersFromData:(NSDictionary *)data {
  NSArray *items = data[@"items"];
  NSMutableArray *answers = [[NSMutableArray alloc]init];
  for (NSDictionary *answerInfo in items) {
    NSNumber *answerID = answerInfo[@"answer_id"];
    bool isAccepted = answerInfo[@"is_accepted"];
    NSNumber *score = answerInfo[@"score"];
    NSString *profileImageURL =answerInfo[@"profile_image"];
    Answer *answer = [[Answer alloc]initWithAnswerID:answerID.integerValue isaccepted:isAccepted score:score.integerValue profileImageURL:profileImageURL];
    [answers addObject:answer];
  }
  return answers;
}

@end
