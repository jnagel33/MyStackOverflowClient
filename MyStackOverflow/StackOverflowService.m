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

@implementation StackOverflowService

+(void)fetchQuestionsForSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray* items, NSString *error))completionHandler {
  
 NSString *urlStr = [NSString stringWithFormat:@"%@%@?order=desc&sort=activity&site=stackoverflow&&key=1F7UZ5g3*p4JmBttfjVUwg((&intitle=%@",kStackOverflowBase, kSearchEndpoint, searchTerm];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&token=%@", token]];
  }
  
  
//  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
//  [[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//    if (error != nil) {
//      //handle error
//    } else {
//      NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
//      if (statusCode == 200) {
//        NSArray * questions = [StackOverflowJSONParser parseSearchQuestionsFromData:data];
//        dispatch_async(dispatch_get_main_queue(), ^{
//          completionHandler(questions, nil);
//        });
//        
//        
//      } else {
//        completionHandler(nil, @"error http");
//      }
//    }
//  }]resume];
}


+(void)fetchUserProfile:(void (^)(User* user, NSString *error))completionHandler {
  
  
  NSString *urlStr = [NSString stringWithFormat:@"%@%@/me",kStackOverflowBase, kUserEndpoint];
  
  NSString *token = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
  if (token) {
    NSLog(@"%@",token);
    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"&token=%@", token]];
  }
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
  [[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error != nil) {
      //handle error
    } else {
      NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
      if (statusCode == 200) {
        User * user = [StackOverflowJSONParser parseUserInfoFromData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
          completionHandler(user, nil);
        });
        
      } else {
        completionHandler(nil, @"error http");
      }
    }
  }]resume];

  
}

@end
