//
//  Demo7.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/16.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "Demo7.h"

@interface Demo7 ()

@end

@implementation Demo7

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // block外修改，block内输出
    [self test1];
    
    // 集合的copy与mutableCopy
    [self test2];
}

#pragma mark - DidReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Notification Methods


#pragma mark - KVO Methods


#pragma mark - Delegate


#pragma mark - Target Methods


#pragma mark - Private Methods
// 可变集合类的mutableCopy是深拷贝，会复制出一个新的可变集合类。
// 然后可变集合类的copy也是深拷贝，会复制出一个新的不可变集合。
- (void)test2 {
    
    NSArray *a1 = @[@"1", @"2"];
    NSMutableArray *a2 = @[@"1", @"2"].mutableCopy;
    
    id b1 = [a1 copy];
    id b2 = [a2 copy];
    
    NSLog(@"b1 = a1 value: %@" , b1==a1?@"YES":@"NO");
    NSLog(@"b2 = a2 value: %@" , b2==a2?@"YES":@"NO");
}

- (void)test1 {
    __block NSString *str = @"a";
    NSLog(@"str初始化：str---%@, str---%p, &str---%p", str, str, &str);
    
    NSMutableString *mStr = [NSMutableString stringWithFormat:@"A"];
    NSLog(@"mStr初始化：mStr---%@, mStr---%p, &mStr---%p", mStr, mStr, &mStr);
    
    __block NSInteger i = 1;
    NSLog(@"i初始化：i---%ld, i---%p, &i---%p", (long)i, i, &i);
    
    void (^block)(void) = ^{
        NSLog(@"block内：str：str---%@, str---%p, &str---%p", str, str, &str);
        NSLog(@"block内：mStr：mStr---%@, mStr---%p, &mStr---%p", mStr, mStr, &mStr);
        NSLog(@"block内：i：i---%ld, i---%p, &i---%p", (long)i, i, &i);
        
        NSLog(@"======");
        NSLog(@"%@_%@_%@", str, mStr, @(i));
    };
    str = @"c";
    NSLog(@"str第一次修改：str---%@, str---%p, &str---%p", str, str, &str);
    [mStr appendString:@"C"];
    NSLog(@"mStr第一次修改：mStr---%@, mStr---%p, &mStr---%p", mStr, mStr, &mStr);
    i = 3;
    NSLog(@"i第一次修改：i---%ld, i---%p, &i---%p", (long)i, i, &i);
    block();
}

#pragma mark - Initial Methods


#pragma mark - Setter Getter Methods


@end
