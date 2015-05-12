//
//  BurgerContainerViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "BurgerContainerViewController.h"
#import "MainViewController.h"
#import "SideMenuTableViewController.h"
#import "SideMenuSelectionDelegate.h"
#import "MyQuestionsViewController.h"
#import "SearchQuestionsViewController.h"

@interface BurgerContainerViewController () <SideMenuSelectionDelegate>

@property(strong,nonatomic)UIPanGestureRecognizer *slideGesture;
@property(strong,nonatomic)UIViewController *topViewController;
@property(strong,nonatomic)SideMenuTableViewController *sideMenuVC;
@property(strong,nonatomic)UIButton *burgerButton;
@property(strong,nonatomic)UITapGestureRecognizer *tapToClose;
@property (strong,nonatomic) MyQuestionsViewController *myQuestionsVC;
@property (strong,nonatomic) SearchQuestionsViewController *searchQuestionsVC;

@end

@implementation BurgerContainerViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  SideMenuTableViewController *sideMenuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SideMenuVC"];
  [self addChildViewController:sideMenuVC];
  sideMenuVC.view.frame = self.view.frame;
  [self.view addSubview:sideMenuVC.view];
  [sideMenuVC didMoveToParentViewController:self];
  sideMenuVC.delegate = self;
  
  SearchQuestionsViewController *searchQuestionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchQuestionsVC"];
  [self addChildViewController:searchQuestionsVC];
  searchQuestionsVC.view.frame = self.view.frame;
  [self.view addSubview:searchQuestionsVC.view];
  [searchQuestionsVC didMoveToParentViewController:self];
  self.topViewController = searchQuestionsVC;
  self.searchQuestionsVC = searchQuestionsVC;
  
  self.slideGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(slideSideMenu:)];
  [self.topViewController.view addGestureRecognizer:self.slideGesture];
  
  UIButton *burgerButton = [[UIButton alloc]initWithFrame:CGRectMake(14, 25, 50, 44)];
  [burgerButton setBackgroundImage:[UIImage imageNamed:@"BurgerButton"] forState:UIControlStateNormal];
  [burgerButton addTarget:self action:@selector(showSideMenu) forControlEvents:UIControlEventTouchUpInside];
  [self.topViewController.view addSubview:burgerButton];
  self.burgerButton = burgerButton;
  
  self.tapToClose = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeSideMenu)];
}

-(void)slideSideMenu:(UIPanGestureRecognizer *)pan {
  CGPoint translatedPoint = [pan translationInView:self.view];
  CGPoint velocity = [pan velocityInView:self.view];
  
  if (pan.state == UIGestureRecognizerStateChanged) {
    if (velocity.x > 0 || self.topViewController.view.frame.origin.x > 0) {
      self.topViewController.view.center = CGPointMake(self.topViewController.view.center.x + translatedPoint.x, self.topViewController.view.center.y);
      [pan setTranslation:CGPointZero inView:self.view];
    }
  } else if (pan.state == UIGestureRecognizerStateEnded) {
    if (self.topViewController.view.frame.origin.x > self.view.frame.size.width / 3) {
      [self showSideMenu];
    } else {
      [self closeSideMenu];
    }
  }
}

-(void)switchToViewController:(UIViewController *)destinationVC {
  
  [UIView animateWithDuration:0.2 animations:^{
    
    self.topViewController.view.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
  } completion:^(BOOL finished) {
    destinationVC.view.frame = self.topViewController.view.frame;
    
    [self.topViewController.view removeGestureRecognizer:self.slideGesture];
    [self.burgerButton removeFromSuperview];
    [self.topViewController willMoveToParentViewController:nil];
    [self.topViewController.view removeFromSuperview];
    [self.topViewController removeFromParentViewController];
    
    self.topViewController = destinationVC;
    [self addChildViewController:self.topViewController];
    [self.view addSubview:self.topViewController.view];
    [self.topViewController didMoveToParentViewController:self];
    [self.topViewController.view addSubview:self.burgerButton];
    [self.topViewController.view addGestureRecognizer:self.slideGesture];
    
    [UIView animateWithDuration:0.3 animations:^{
      self.topViewController.view.center = self.view.center;
    } completion:^(BOOL finished) {
      self.burgerButton.userInteractionEnabled = true;
    }];
    
  }];
  
}


-(void)userDidSelectOption:(NSInteger)selection {
  if (selection == 0) {
    if (self.topViewController != self.searchQuestionsVC) {
      [self switchToViewController:self.searchQuestionsVC];
      return;
    }
  }
  if (selection == 1) {
    if (self.topViewController != self.myQuestionsVC) {
      [self switchToViewController:self.myQuestionsVC];
      return;
    }
  }
  [self closeSideMenu];
}

-(void)showSideMenu {
  self.burgerButton.userInteractionEnabled = false;
  [UIView animateWithDuration:0.2 animations:^{
    self.topViewController.view.frame = CGRectMake(self.view.frame.size.width * 0.6, 0, self.topViewController.view.frame.size.width, self.topViewController.view.frame.size.height);
  } completion:^(BOOL finished) {
    [self.topViewController.view addGestureRecognizer:self.tapToClose];
  }];
}

-(void)closeSideMenu {
  [self.topViewController.view removeGestureRecognizer:self.tapToClose];
  [UIView animateWithDuration:0.2 animations:^{
    self.topViewController.view.center = self.view.center;
  } completion:^(BOOL finished) {
    self.burgerButton.userInteractionEnabled = true;
  }];

}

-(MyQuestionsViewController *)myQuestionsVC {
  if (_myQuestionsVC != nil) {
    return _myQuestionsVC;
  }
  _myQuestionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyQuestionsVC"];
  return _myQuestionsVC;
}

-(SearchQuestionsViewController *)searchQuestionsVC {
  if (_searchQuestionsVC != nil) {
    return _searchQuestionsVC;
}
  
  _searchQuestionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchQuestionsVC"];
  return _searchQuestionsVC;
}


@end
