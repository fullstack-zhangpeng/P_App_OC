//
//  Demo1.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/9/8.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "Demo1.h"

@interface Demo1 ()

@end

@implementation Demo1

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Notification Methods


#pragma mark - KVO Methods


#pragma mark - Delegate


#pragma mark - Target Methods


#pragma mark - Private Methods


#pragma mark - Initial Methods
- (void)setupUI {
    
    UIView *superView = self.view;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    UILabel *label = [[UILabel alloc] init];
    label.text = @"测试数据为79.04";
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(superView).offset(10);
        make.left.equalTo(superView).offset(10);
    }];
    
    UILabel *errorResultL = [[UILabel alloc] init];
    [self.view addSubview:errorResultL];
    errorResultL.text = [NSString stringWithFormat:@"转换错误的结果为%@", dic[@"double"]];
    
    [errorResultL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.equalTo(superView).offset(10);
    }];
    
    UILabel *correctResultL = [[UILabel alloc] init];
    [self.view addSubview:correctResultL];
    
    double d = [dic[@"double"] doubleValue];
    NSString *dStr = [NSString stringWithFormat:@"%f", d];
    NSDecimalNumber *dn = [NSDecimalNumber decimalNumberWithString:dStr];
    
    correctResultL.text = [NSString stringWithFormat:@"转换成功的结果为%@", dn.stringValue];
    
    [correctResultL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(errorResultL.mas_bottom).offset(10);
        make.left.equalTo(superView).offset(10);
    }];
}

#pragma mark - Setter Getter Methods


@end
