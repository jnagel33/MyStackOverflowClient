//
//  User.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface User : NSObject

@property(nonatomic)NSInteger accountId;
@property(strong,nonatomic)NSString *displayName;
@property(nonatomic)NSInteger reputation;
@property(nonatomic)NSInteger acceptRate;
@property(strong,nonatomic)NSString *profileImageURL;
@property(strong,nonatomic)UIImage *profileImage;
@property(strong,nonatomic)NSDictionary *badgeCounts;

-(instancetype)initWithAccountID: (NSInteger)accountID displayName:(NSString *)displayName reputation: (NSInteger)reputation acceptRate:(NSInteger)acceptRate profileImageURL:(NSString *)profileImageURL badgeCounts:(NSDictionary *)badgeCount;

@end
