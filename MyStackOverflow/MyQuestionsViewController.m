//
//  MyQuestionsViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "MyQuestionsViewController.h"
#import "StackOverFlowStyleKit.h"
#import "StackOverflowService.h"
#import "Question.h"
#import "QuestionsTableViewCell.h"
#import "QuestionWebViewController.h"
#import "NoResultsTableViewCell.h"

@interface MyQuestionsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)StackOverflowService *stackService;
@property(strong,nonatomic)NSArray *questions;

@end

@implementation MyQuestionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  
  [self.tableView registerClass:[NoResultsTableViewCell class] forCellReuseIdentifier:@"NoResultsCell"];
  self.stackService = [StackOverflowService sharedService];
  self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MyQuestions"]];
  
  self.view.backgroundColor = [StackOverFlowStyleKit lightGray];
  
  [self.stackService fetchUserQuestions:^(NSArray *questions, NSString *error) {
    self.questions = questions;
    [self.tableView reloadData];
  }];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (self.questions.count == 0) {
    NoResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoResultsCell" forIndexPath:indexPath];
    return cell;
  } else {
    QuestionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell" forIndexPath:indexPath];
    Question *question = self.questions[indexPath.section];
    [cell configureCell:question];
    return cell;
  }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  if (self.questions.count == 0) {
    return 1;
  }
  return self.questions.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return @" ";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 12;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 12)];
  headerView.backgroundColor = [StackOverFlowStyleKit orange];
  
  return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Question *question = self.questions[indexPath.section];
  [tableView deselectRowAtIndexPath:indexPath animated:true];
  
  QuestionWebViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchWebVC"];
  webVC.link = question.link;
  webVC.view.frame = self.view.frame;
  [self presentViewController:webVC animated:true completion:nil];
}


@end
