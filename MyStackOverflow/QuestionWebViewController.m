//
//  QuestionWebViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/14/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "QuestionWebViewController.h"
#import <WebKit/WebKit.h>

@interface QuestionWebViewController ()

@property(strong,nonatomic)WKWebView *webView;

@end

@implementation QuestionWebViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.webView = [[WKWebView alloc]initWithFrame:self.view.frame];
  [self.view addSubview:self.webView];
  
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.link]]];
}

@end
