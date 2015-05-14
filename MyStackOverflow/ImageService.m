//
//  ImageService.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "ImageService.h"
#import <UIKit/UIKit.h>

@interface ImageService ()

@end

@implementation ImageService

+(id)sharedService {
  static ImageService *sharedService = nil;
  sharedService = [[self alloc]init];
  return self;
}

-(void)fetchProfileImages:(NSArray *)urls completionHandler:(void (^)(NSArray* images))completionHandler {
  dispatch_group_t group = dispatch_group_create();
  NSMutableArray *images = [[NSMutableArray alloc]init];
  
  
  dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    NSArray *firstTen = [urls subarrayWithRange:NSMakeRange(0, 10)];
    for (NSString *url in firstTen) {
      [images addObject:[self getImageFromURL:url]];
    }
  });
  
  dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    NSArray *secondTen = [urls subarrayWithRange:NSMakeRange(9, 10)];
    for (NSString *url in secondTen) {
      [images addObject:[self getImageFromURL:url]];
    }
  });
  
  dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    NSArray *thirdTen = [urls subarrayWithRange:NSMakeRange(19, 10)];
    for (NSString *url in thirdTen) {
      [images addObject:[self getImageFromURL:url]];
    }
  });
  
  dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    completionHandler(images);
  });
}

-(UIImage *)getImageFromURL:(NSString *)urlStr {
  NSURL *url = [NSURL URLWithString:urlStr];
  NSData *imageData = [[NSData alloc]initWithContentsOfURL:url];
  return [UIImage imageWithData:imageData];
}

@end
