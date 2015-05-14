//
//  ProfileTableViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "ProfileImageTableViewCell.h"
#import "DisplayNameTableViewCell.h"
#import "AcceptanceRateReputationTableViewCell.h"
#import "BadgesTableViewCell.h"
#import "StackOverflowService.h"

@interface ProfileTableViewController ()

@property(strong,nonatomic)User *user;

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [StackOverflowService fetchUserProfile:^(User *user, NSString *error) {
    self.user = user;
    [self.tableView reloadData];
  }];
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    ProfileImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileImageViewCell" forIndexPath:indexPath];
    [cell configureCell:self.user];
    return cell;
  } else if (indexPath.row == 1) {
    DisplayNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DisplayNameCell" forIndexPath:indexPath];
    [cell configureCell:self.user];
    return cell;
  } else if (indexPath.row == 2) {
    AcceptanceRateReputationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AcceptanceReputationCell" forIndexPath:indexPath];
    [cell configureCell:self.user];
    return cell;
  } else {
    BadgesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BadgesCell" forIndexPath:indexPath];
    [cell configureCell:self.user];
    return cell;
  }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    return 150;
  }
  return 40;
}

@end
