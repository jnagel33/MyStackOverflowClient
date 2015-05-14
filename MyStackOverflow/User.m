//
//  User.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithAccountID: (NSInteger)accountID displayName:(NSString *)displayName reputation: (NSInteger)reputation acceptRate:(NSInteger)acceptRate profileImageURL:(NSString *)profileImageURL badgeCounts:(NSDictionary *)badgeCount {
  _accountId = accountID;
  _displayName = displayName;
  _reputation = reputation;
  _acceptRate = acceptRate;
  _profileImageURL = profileImageURL;
  _badgeCounts = badgeCount;
  
  return self;
}

@end
