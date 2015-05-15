//
//  StackOverflowService.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

#define kStackOverflowBase @"https://api.stackexchange.com/2.2"
#define kSearchEndpoint @"/search"
#define kMeEndpoint @"/me"
#define kQuestionEndpoint @"/questions"
#define kAnswersEndpoint @"/answers"
@class AFHTTPRequestOperationManager;

@interface StackOverflowService : NSObject

+(id) sharedService;

@property(strong,nonatomic) AFHTTPRequestOperationManager *manager;

-(void)fetchQuestionsForSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray* answers, NSString *error))completionHandler;

-(void)fetchUserProfile:(void (^)(User* user, NSString *error))completionHandler;

-(void)fetchUserQuestions:(void (^)(NSArray *questions, NSString *error))completionHandler;

//-(void)fetchAnswerIDsToQuestion:(NSInteger) questionID completionHandler:(void (^)(NSArray *answerIDs, NSString *error))completionHandler;
//-(void)fetchAnswerByIDs:(NSArray *)answerIDs completionHandler:(void (^)(NSArray *answerIDs, NSString *error))completionHandler;
@end
