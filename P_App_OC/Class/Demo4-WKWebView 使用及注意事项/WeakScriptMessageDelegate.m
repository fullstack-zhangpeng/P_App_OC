//
//  WeakScriptMessageDelegate.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/11/29.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "WeakScriptMessageDelegate.h"

@implementation WeakScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}

@end
