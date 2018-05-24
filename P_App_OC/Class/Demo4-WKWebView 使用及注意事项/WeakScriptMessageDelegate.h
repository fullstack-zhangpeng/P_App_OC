//
//  WeakScriptMessageDelegate.h
//  P_App_OC
//
//  Created by 张鹏 on 2017/11/29.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WeakScriptMessageDelegate : NSObject

@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;

@end
