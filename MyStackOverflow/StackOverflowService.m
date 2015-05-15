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

@interface StackOverflowService ()

@end

@implementation StackOverflowService

+(id) sharedService {
  static StackOverflowService *mySharedService = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    mySharedService = [[self alloc] init];
  });
  return mySharedService;
}

-(AFHTTPRequestOperationManager *)manager {
  if (_manager != nil) {
    return _manager;
  }
  _manager = [AFHTTPRequestOperationManager manager];
  return _manager;
}

-(void)fetchQuestionsForSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray* items, NSString *error))completionHandler {
  
  NSString *searchText = [searchTerm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  
 NSString *urlStr = [NSString stringWithFormat:@"%@%@?order=desc&sort=activity&site=stackoverflow&&key=1F7UZ5g3*p4JmBttfjVUwg((&intitle=%@",kStackOverflowBase, kSearchEndpoint, searchText];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&token=%@", token]];
  }
  [self.manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    NSArray * questions = [StackOverflowJSONParser parseSearchQuestionsFromData:responseObject];
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(questions, nil);
    });
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
  }];
}


-(void)fetchUserProfile:(void (^)(User *user, NSString *error))completionHandler {
  
  NSString *urlStr = [NSString stringWithFormat:@"%@%@?site=stackoverflow&key=1F7UZ5g3*p4JmBttfjVUwg((", kStackOverflowBase, kMeEndpoint];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&access_token=%@", token]];
  }
  
  [self.manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    User *user = [StackOverflowJSONParser parseUserInfoFromData:responseObject];
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(user, nil);
    });
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@",error.description);
  }];
}


-(void)fetchUserQuestions:(void (^)(NSArray *questions, NSString *error))completionHandler {
  
  NSString *urlStr = [NSString stringWithFormat:@"%@%@%@?site=stackoverflow&key=1F7UZ5g3*p4JmBttfjVUwg((", kStackOverflowBase, kMeEndpoint, kQuestionEndpoint];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&access_token=%@", token]];
  }
  
  [self.manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    NSArray *questions = [StackOverflowJSONParser parseSearchQuestionsFromData:responseObject];
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(questions, nil);
    });
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@",error.description);
  }];
}


@end
