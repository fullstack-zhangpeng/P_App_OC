//
//  NSTimer+Category.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/2/17.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "NSTimer+Category.h"

@implementation NSTimer (Category)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     block:(void (^)(void))block
                                   repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)blockInvoke:(NSTimer*)timer
{
    void(^block)(void) = timer.userInfo;
    if (block)
    {
        block();
    }
}

@end
