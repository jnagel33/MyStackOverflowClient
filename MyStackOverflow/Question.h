//
//  Question.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/12/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Question : NSObject

@property(nonatomic)NSInteger questionID;
@property(strong,nonatomic)NSString *title;
@property(nonatomic)BOOL isAnswered;
@property(strong,nonatomic)NSArray *tags;
@property(strong,nonatomic)NSString *profileImageURL;
@property(strong,nonatomic)UIImage *profileImage;
@property(strong,nonatomic)NSString *createdAt;

-(instancetype)init:(NSInteger)questionID withTitle:(NSString *)title andIsAnswered:(BOOL)isAnswered withTags:(NSArray *)tags AndProfileImageURL:(NSString *)profileImageURL AndCreatedAt:(NSString *)createdAt;

@end
