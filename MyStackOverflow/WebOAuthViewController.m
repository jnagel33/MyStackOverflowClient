//
//  WebOAuthViewController.m
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import "WebOAuthViewController.h"
#import <WebKit/WebKit.h>
#import "BurgerContainerViewController.h"

@interface WebOAuthViewController () <WKNavigationDelegate>

@property(strong,nonatomic)WKWebView *webView;

@end

@implementation WebOAuthViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.webView = [[WKWebView alloc]initWithFrame:self.view.frame];
  [self.view addSubview:self.webView];
  self.webView.navigationDelegate = self;
  
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://stackexchange.com/oauth/dialog?client_id=4789&scope=no_expiry&redirect_uri=https://stackexchange.com/oauth/login_success"]]];
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
  NSURLRequest *request = navigationAction.request;
  NSURL *url = request.URL;
  NSLog(@"%@", url);
  decisionHandler(WKNavigationActionPolicyAllow);
  
  
  if ([url.description containsString:@"access_token"]) {
    NSArray *components = [[url description]componentsSeparatedByString:@"="];
    NSString *token = components.lastObject;
    NSLog(@"%@",token);
    [[NSUserDefaults standardUserDefaults]setObject:token forKey:@"token"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self dismissViewControllerAnimated:true completion:^{
    }];
  }
}

@end
