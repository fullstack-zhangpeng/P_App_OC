//
//  BaseVC.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/9/8.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

#pragma mark - LifeCircle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"进入控制器： %@", [[self class] description]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 将原点移动到NavigationBar下面
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
    
    NSLog(@"控制器被delloc： %@", [[self class] description]);
}

#pragma mark - Notification Methods


#pragma mark - KVO Methods


#pragma mark - Delegate


#pragma mark - Target Methods


#pragma mark - Private Methods


#pragma mark - Initial Methods


#pragma mark - Setter Getter Methods


#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
