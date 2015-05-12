//
//  MainMenuTableViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "SideMenuTableViewController.h"
#import "StackOverFlowStyleKit.h"

@interface SideMenuTableViewController ()

@end

@implementation SideMenuTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.backgroundColor = [StackOverFlowStyleKit orange];
  self.tableView.separatorColor = [StackOverFlowStyleKit orange];
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

@end
