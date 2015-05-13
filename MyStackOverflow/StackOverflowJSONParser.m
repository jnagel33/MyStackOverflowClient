//
//  StackOverflowJSONParser.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "StackOverflowJSONParser.h"
#import "Question.h"

@implementation StackOverflowJSONParser

+(NSArray *)parseSearchQuestionsFromData:(NSData *)data {
  NSMutableArray *questionsList = [[NSMutableArray alloc]init];
  NSError *error;
  id questionListInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
  NSArray *questions = questionListInfo[@"items"];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  for (NSDictionary *questionInfo in questions) {
    NSNumber *questionID = questionInfo[@"question_id"];
    NSString *title = questionInfo[@"title"];
    BOOL isAnswered = questionInfo[@"is_answered"];
    NSArray *tags = questionInfo[@"tags"];
    if (tags.count > 3) {
      tags = [tags subarrayWithRange:NSMakeRange(0, 3)];
    }
    NSDictionary *owner = questionInfo[@"owner"];
    NSString *profileImageURL = owner[@"profile_image"];
    NSNumber *createdAt = questionInfo[@"creation_date"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:createdAt.integerValue];
    NSString *dateString = [dateFormatter stringFromDate:date];
    Question *question = [[Question alloc]init:questionID.integerValue withTitle:title andIsAnswered:isAnswered withTags:tags AndProfileImageURL:profileImageURL AndCreatedAt:dateString
                          ];
    [questionsList addObject:question];
  }
  return questionsList;
}

@end
