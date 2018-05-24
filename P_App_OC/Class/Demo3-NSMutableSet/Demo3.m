//
//  Demo3.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/11/29.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "Demo3.h"

@interface Demo3 ()

@end

@implementation Demo3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableSet *mSet = [[NSMutableSet alloc] init];
    [mSet addObject:@[@1, @2]];
    NSLog(@"1---%@", mSet);
    [mSet isEqual:mSet];
    NSMutableArray *mArr = [[NSMutableArray alloc] initWithObjects:@1, nil];
    [mSet addObject:mArr];
    NSLog(@"2---%@", mSet);

    [mArr addObject:@2];
    NSLog(@"3---%@", mSet);

    [mSet addObject:@[@1, @2]];
    NSLog(@"4---%@", mSet);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
