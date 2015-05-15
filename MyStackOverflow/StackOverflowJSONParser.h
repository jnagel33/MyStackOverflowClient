//
//  StackOverflowJSONParser.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface StackOverflowJSONParser : NSObject

+(NSArray *)parseSearchQuestionsFromData:(NSDictionary *)data;

+(User *)parseUserInfoFromData:(NSDictionary *)data;

@end
