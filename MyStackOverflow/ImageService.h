//
//  ImageService.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageService : NSObject

+(id)sharedService;

-(void)fetchProfileImages:(NSArray *)urls completionHandler:(void (^)(NSArray* images))completionHandler;

@end
