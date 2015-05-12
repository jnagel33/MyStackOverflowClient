//
//  LoginViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property(strong,nonatomic) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginButtonBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoBottomConstraint;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.logoBottomConstraint.constant += 300;
  [UIView animateWithDuration:1 delay:0.3 usingSpringWithDamping:0.9 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    [self.view layoutIfNeeded];
  } completion:^(BOOL finished) {
    self.loginButtonBottomConstraint.constant +=310;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
      [self.view layoutIfNeeded];
    } completion:nil];
    
  }];
  
  
  UICollisionBehavior *collision = [[UICollisionBehavior alloc] init];
  UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
  UIDynamicItemBehavior *elasticityBehavior =
  [[UIDynamicItemBehavior alloc] init];
  for (int i = 0; i < 20; i++) {
    UIView *orangeView = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 60, i * 15 , 40, 10)];
    
    [elasticityBehavior addItem:orangeView];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    [gravity addItem:orangeView];
    [collision setTranslatesReferenceBoundsIntoBoundary:true];
    [collision addItem:orangeView];
    
    UIView *orangeView2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x + 40, i * 15, 40, 10)];
    
    [elasticityBehavior addItem:orangeView2];
    orangeView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:orangeView2];
    [gravity addItem:orangeView2];
    [collision setTranslatesReferenceBoundsIntoBoundary:true];
    [collision addItem:orangeView2];
    
    UIView *orangeView3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 120, i * 15 , 40, 10)];
    
    [elasticityBehavior addItem:orangeView3];
    orangeView3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:orangeView3];
    [gravity addItem:orangeView3];
    [collision setTranslatesReferenceBoundsIntoBoundary:true];
    [collision addItem:orangeView3];
    
    UIView *orangeView4 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x + 80, i * 15, 40, 10)];
    
    [elasticityBehavior addItem:orangeView4];
    orangeView4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView4];
    [gravity addItem:orangeView4];
    [collision setTranslatesReferenceBoundsIntoBoundary:true];
    [collision addItem:orangeView4];
  }
  
  elasticityBehavior.elasticity = 0.9f;
  [self.animator addBehavior:elasticityBehavior];
  
  [self.animator addBehavior:collision];
  [self.animator addBehavior:gravity];
}

- (UIDynamicAnimator *)animator {
  if (_animator != nil ) {
    return _animator;
  }
  _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
  return _animator;
}
@end