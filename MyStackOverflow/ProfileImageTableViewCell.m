//
//  ProfileImageTableViewCell.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "ProfileImageTableViewCell.h"
#import "ImageService.h"
#import "ImageResizer.h"
#import "User.h"

const NSInteger kLargeProfileImageViewHeightWidth = 150;

@interface ProfileImageTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;


@end

@implementation ProfileImageTableViewCell

-(void)configureCell:(User *)user {
  self.profileImageView.image = nil;
  
  if (user.profileImage) {
    self.profileImageView.image = user.profileImage;
  } else {
    ImageService *imageService = [[ImageService alloc]init];
    UIImage *resizedImage = [ImageResizer resizeImage:[imageService getImageFromURL:user.profileImageURL] withSize:CGSizeMake(kLargeProfileImageViewHeightWidth, kLargeProfileImageViewHeightWidth)];
    user.profileImage = resizedImage;
    self.profileImageView.image = user.profileImage;
  }
  
  
}

@end
