//
//  Answer.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Answer : NSObject

@property(nonatomic)NSInteger answerID;
@property(nonatomic)BOOL isAccepted;
@property(nonatomic)NSInteger score;
@property(strong,nonatomic)NSString *profileImageURL;

-(instancetype)initWithAnswerID:(NSInteger)answerID isaccepted:(BOOL)isAccepted score:(NSInteger)score profileImageURL:(NSString *)profileImageURL;

@end
