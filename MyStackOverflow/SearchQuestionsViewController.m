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
#import "ImageService.h"
#import "Question.h"
#import "ImageResizer.h"
#import "QuestionWebViewController.h"

const CGFloat kProfileImageSizeWidthHeight = 50;

@interface SearchQuestionsViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(strong,nonatomic)NSArray *questions;
@property(strong,nonatomic)StackOverflowService *stackService;

@end

@implementation SearchQuestionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.stackService = [StackOverflowService sharedService];
  
  self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SearchQuestions"]];
  [self.navigationController.navigationBar setBarTintColor:[StackOverFlowStyleKit lightGray]];
  [self.searchBar setBarTintColor:[StackOverFlowStyleKit lightGray]];
  
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.searchBar.delegate = self;
  
  self.tableView.estimatedRowHeight = 90;
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  
 }

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  QuestionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell" forIndexPath:indexPath];
  Question *question = self.questions[indexPath.section];
  [cell configureCell:question];
  return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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

#pragma mark - UISearchBarDelegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  if (searchBar.text) {
    [self.searchBar resignFirstResponder];
    [self.stackService fetchQuestionsForSearchTerm:searchBar.text completionHandler:^(NSArray *items, NSString *error) {
      if (error != nil) {
        //handle error
      } else {
        self.questions = items;
        [self.tableView reloadData];
        
        NSMutableArray *urls = [[NSMutableArray alloc]init];
        for (Question *question in self.questions) {
          [urls addObject:question.profileImageURL];
        }
        ImageService *myImageService = [[ImageService alloc]init];
          [myImageService fetchProfileImages:urls completionHandler:^(NSArray *images) {
            for (int i=0; i < self.questions.count; i++) {
              Question *question = self.questions[i];
              question.profileImage = [ImageResizer resizeImage:images[i] withSize:CGSizeMake(kProfileImageSizeWidthHeight, kProfileImageSizeWidthHeight)];
            }
            [self.tableView reloadData];
          }];
        
      }
    }];
  }
}

@end
