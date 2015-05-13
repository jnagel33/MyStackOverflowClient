//
//  StackOverflowService.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kStackOverflowBase @"https://api.stackexchange.com/2.2/"
#define kSearchEndpoint @"/search"

@interface StackOverflowService : NSObject

+(void)fetchQuestionsForSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray* items, NSString *error))completionHandler;

@end
