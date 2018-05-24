//
//  Demo4.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/11/29.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "Demo4.h"
#import <WebKit/WebKit.h>
#import "WeakScriptMessageDelegate.h"

@interface Demo4 ()<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

// WKWebViewConfiguration
@property(nonatomic, strong) WKWebViewConfiguration *config;

// webView
@property(nonatomic, strong) WKWebView *webView;

// 顶部进度条
@property(nonatomic, strong) UIProgressView *progressView;

// script脚本数组
@property(nonatomic, strong) NSArray *scriptMessages;

@end

@implementation Demo4

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scriptMessages = @[
                            @"test1",
                            @"test2"
                            ];
    
    [self setupUI];
    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0f];
//    [_webView loadRequest:request];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0f];
    [request setValue:@"userId=zhangpeng" forHTTPHeaderField:@"Cookie"];
    [_webView loadRequest:request];
}

- (void)dealloc {
    
    NSLog(@"delloc");
    for (NSString *scriptMessage in self.scriptMessages) {
        
        [self.config.userContentController removeScriptMessageHandlerForName:scriptMessage];
    }
}

#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Notification Methods


#pragma mark - KVO Methods


#pragma mark - Delegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    completionHandler();
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    // 打印所传过来的参数，只支持NSNumber, NSString, NSDate, NSArray,
    // NSDictionary, and NSNull类型
    if ([message.name isEqualToString:@"test1"]) {
        
        NSLog(@"触发了test1");
        
    } else if ([message.name isEqualToString:@"test2"]) {
        
        NSLog(@"触发了test2");
        
    } else {
        
    }
}

// 当因为某些问题，导致webView进程终止时触发
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    
    NSLog(@"%s", __func__);
}

// 进行证书验证时触发
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
//
//    NSLog(@"%s", __func__);
//
//    NSURLCredential *card = [[NSURLCredential alloc]initWithTrust:challenge.protectionSpace.serverTrust];
//
//    completionHandler(NSURLSessionAuthChallengeUseCredential, card);
//}

// 当由服务端进行重定向时触发
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    
    NSLog(@"%s", __func__);
}

// 当web view加载内容失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __func__);
}

// 当跳转失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
    NSLog(@"%s", __func__);
}

// 5.页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __func__);
}

/// 4.当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __func__);
}

// 3.知道返回内容之后，是否允许加载
-(void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%s", __func__);
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 2.开始加载网页
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __func__);
}

// 1.是否允许跳转
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"%s", __func__);
    decisionHandler(WKNavigationActionPolicyAllow);
}


#pragma mark - Target Methods


#pragma mark - Private Methods


#pragma mark - Initial Methods
- (void)setupUI {
    
    // WKUserContentController对象为JavaScript提供了一种方式，可以将消息发送到web视图，并将用户脚本注入到web视图中。
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    
    // 执行js，添加cookies
    NSString *js = @"document.cookie='userId=zhangpeng'";
    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [userContentController addUserScript:cookieScript];
    
    // 用于初始化web视图的属性集合。
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = userContentController;
    _config = config;
    
    // 注入JS对象名称，当JS通过对象名称来调用时，我们可以在WKScriptMessageHandler代理中接收到
    for (NSString *scriptMessage in self.scriptMessages) {

        [config.userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:scriptMessage];
    }
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kMainAreaHeightNoTab) configuration:config];
    /*
     UIDelegate: web view的用户界面代理。
     WKUIDelegate类提供了代表网页呈现本地用户界面元素的方法。
     */
    webView.UIDelegate = self;
    /*
     navigationDelegate: web view的导航代理。
     WKNavigationDelegate协议的方法帮助您实现在web view接受、加载和完成导航请求过程中触发的自定义行为。
     */
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    _webView = webView;
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight+kNavBarHeight, kScreenW, 2)];
    progressView.progressTintColor = [UIColor redColor];
    progressView.trackTintColor = [UIColor whiteColor];
    [self.view addSubview:progressView];
    _progressView = progressView;
}

#pragma mark - Setter Getter Methods


@end
