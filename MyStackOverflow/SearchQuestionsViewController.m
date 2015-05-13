//
//  SearchQuestionsViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "SearchQuestionsViewController.h"
#import "StackOverFlowStyleKit.h"
#import "StackOverflowService.h"
#import "QuestionsTableViewCell.h"

@interface SearchQuestionsViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(strong,nonatomic)NSArray *questions;

@end

@implementation SearchQuestionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SearchQuestions"]];
  [self.navigationController.navigationBar setBarTintColor:[StackOverFlowStyleKit lightGray]];
  [self.searchBar setBarTintColor:[StackOverFlowStyleKit lightGray]];
  
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.searchBar.delegate = self;
  
 }

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.questions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  QuestionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell" forIndexPath:indexPath];
  Question *question = self.questions[indexPath.row];
  [cell configureCell:question];
  return cell;
}

#pragma mark - UISearchBarDelegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  if (searchBar.text) {
    [self.searchBar resignFirstResponder];
    [StackOverflowService fetchQuestionsForSearchTerm:searchBar.text completionHandler:^(NSArray *items, NSString *error) {
      if (error != nil) {
        //handle error
      } else {
        self.questions = items;
        [self.tableView reloadData];
      }
    }];
  }
}

@end
