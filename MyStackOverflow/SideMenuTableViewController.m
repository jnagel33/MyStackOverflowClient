//
//  MainMenuTableViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "SideMenuTableViewController.h"
#import "StackOverFlowStyleKit.h"
#import "SideMenuTableViewCell.h"

@interface SideMenuTableViewController ()

@end

@implementation SideMenuTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.backgroundColor = [StackOverFlowStyleKit orange];
  self.tableView.separatorColor = [StackOverFlowStyleKit orange];
  
  UINib *cellNib = [UINib nibWithNibName:@"SideMenuTableViewCell" bundle:[NSBundle mainBundle]];
  [self.tableView registerNib:cellNib forCellReuseIdentifier:@"SideMenuCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.delegate userDidSelectOption:indexPath.section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  if (section == 0) {
    return 40;
  }
  return 0.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  SideMenuTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SideMenuCell" forIndexPath:indexPath];
  if (indexPath.section == 0) {
    cell.sectionImageView.image = [UIImage imageNamed:@"SearchQuestions"];
  } else if (indexPath.section == 1) {
    cell.sectionImageView.image = [UIImage imageNamed:@"MyQuestions"];
  } else {
    cell.sectionImageView.image = [UIImage imageNamed:@"Profile"];
  }
  return cell;
}

@end
