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
@property(nonatomic, strong, readwrite) UIProgressView *progressView;

@end

@implementation GTDetailViewController

- (void) dealloc{
    // 页面销毁时移除监听
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webView.navigationDelegate = self;
            
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        
        self.webView;
    })];
    
    // 进度条
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.progressView;
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
 
 */
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
//    NSLog(@"===== %@", @(self.webView.estimatedProgress));
    if(self.webView.estimatedProgress==1.0f){
        self.progressView.hidden = YES;
    }else{
        [self.progressView setProgress:self.webView.estimatedProgress];
    }
    
}
/**
 加载完成后
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"");
}


@end
