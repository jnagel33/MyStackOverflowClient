//
//  MyQuestionsViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "MyQuestionsViewController.h"
#import "StackOverFlowStyleKit.h"

@interface MyQuestionsViewController ()

@end

@implementation MyQuestionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MyQuestions"]];
  
  self.view.backgroundColor = [StackOverFlowStyleKit lightGray];
}

@end
