//
//  QuestionsTableViewCell.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;

@interface QuestionsTableViewCell : UITableViewCell

-(void)configureCell:(Question *)question;

@end
