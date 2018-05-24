//
//  Demo9.m
//  P_App_OC
//
//  Created by zhangpeng on 2018/2/14.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "Demo9.h"

#import "NSTimer+Category.h"

@interface Demo9 ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation Demo9

- (void)dealloc
{
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
    [_timer invalidate];
    _timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Timer";

    [self setupTimer];
}

- (void)setupTimer
{
    __weak typeof(self) weakSelf = self;
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
//                                              target:weakSelf
//                                            selector:@selector(countdownTime)
//                                            userInfo:nil
//                                             repeats:YES];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f block:^{
        [weakSelf countdownTime];
    } repeats:YES];
}

- (void)countdownTime
{
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
}

@end
