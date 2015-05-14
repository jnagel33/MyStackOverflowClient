//
//  StackOverflowService.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "StackOverflowService.h"
#import "StackOverflowJSONParser.h"
#import "User.h"
#import "AFNetworking.h"

@implementation StackOverflowService

+(void)fetchQuestionsForSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray* items, NSString *error))completionHandler {
  
  NSString *searchText = [searchTerm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  
 NSString *urlStr = [NSString stringWithFormat:@"%@%@?order=desc&sort=activity&site=stackoverflow&&key=1F7UZ5g3*p4JmBttfjVUwg((&intitle=%@",kStackOverflowBase, kSearchEndpoint, searchText];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&token=%@", token]];
  }
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    NSArray * questions = [StackOverflowJSONParser parseSearchQuestionsFromData:responseObject];
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(questions, nil);
    });
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
  }];
}


+(void)fetchUserProfile:(void (^)(User *user, NSString *error))completionHandler {
  
  NSString *urlStr = [NSString stringWithFormat:@"%@%@?site=stackoverflow&key=1F7UZ5g3*p4JmBttfjVUwg((", kStackOverflowBase, kMeEndpoint];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&access_token=%@", token]];
  }
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    User *user = [StackOverflowJSONParser parseUserInfoFromData:responseObject];
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(user, nil);
    });
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@",error.description);
  }];
}

+(void)fetchAnswerIDsToQuestion:(NSInteger) questionID completionHandler:(void (^)(NSArray *answerIDs, NSString *error))completionHandler {
  NSString *questionIDStr = [NSString stringWithFormat:@"%ld",(long)questionID];
  
  NSString *urlStr = [NSString stringWithFormat:@"%@%@/%@/answers?site=stackoverflow&key=1F7UZ5g3*p4JmBttfjVUwg((", kStackOverflowBase, kQuestionEndpoint, questionIDStr];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&access_token=%@", token]];
  }
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    NSArray *answerIDs = [StackOverflowJSONParser parseAnswerIDsFrom:responseObject];
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(answerIDs, nil);
    });
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@",error.description);
  }];
}

+(void)fetchAnswerByIDs:(NSArray *)answerIDs completionHandler:(void (^)(NSArray *answers, NSString *error))completionHandler {
  NSString *answersStr = [answerIDs componentsJoinedByString:@";"];
  
  NSString *urlStr = [NSString stringWithFormat:@"%@%@/%@?site=stackoverflow&key=1F7UZ5g3*p4JmBttfjVUwg((", kStackOverflowBase, kAnswersEndpoint, answersStr];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&access_token=%@", token]];
  }
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    NSArray *answerIDs = [StackOverflowJSONParser parseAnswerIDsFrom:responseObject];
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(answerIDs, nil);
    });
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@",error.description);
  }];
}


@end
