//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/10.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *webView;

@end

@implementation GTDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://weixin.wstmart.net"]]];
    
    
}

/**
 决定是否要加载网页
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

/**
 加载完成后
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"");
}


@end
