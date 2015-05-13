//
//  StackOverflowService.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "StackOverflowService.h"
#import "StackOverflowJSONParser.h"

@implementation StackOverflowService

+(void)fetchQuestionsForSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray* items, NSString *error))completionHandler {
  
//  NSString *urlStr = @"https://api.stackexchange.com/2.2/search?&order=desc&sort=activity&site=stackoverflow&key=1F7UZ5g3*p4JmBttfjVUwg((&intitle=";
  
 NSString *urlStr = @"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&site=stackoverflow&&key=1F7UZ5g3*p4JmBttfjVUwg((&intitle=swift";
  
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
        NSArray * questions = [StackOverflowJSONParser parseSearchQuestionsFromData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
          completionHandler(questions, nil);
        });
      } else {
        completionHandler(nil, @"error http");
      }
    }
  }]resume];
}

@end
