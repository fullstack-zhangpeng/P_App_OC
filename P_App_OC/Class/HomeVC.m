//
//  HomeVC.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/9/8.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "HomeVC.h"

#import "Demo1.h"
#import "Demo2.h"
#import "Demo3.h"
#import "Demo4.h"
#import "Demo5.h"
#import "Demo6.h"
#import "Demo7.h"
#import "Demo8.h"
#import "Demo9.h"

@interface HomeVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *arr;

@end

@implementation HomeVC

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"P_App_OC";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _arr = @[
             @"【iOS】double 转 String 精度发生变化",
             @"【iOS】面试小结_20171030第1题",
             @"【iOS】面试小结_20171030第2题",
             @"【iOS】WKWebView 使用及注意事项",
             @"【iOS】字符串分割排序",
             @"【iOS】ScrollView",
             @"【iOS】面试_20180116",
             @"【iOS】FilterView",
             @"【iOS】Timer"
             ];
    
    [self setupUI];
}

#pragma mark - Notification Methods


#pragma mark - KVO Methods


#pragma mark - Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *str = [NSString stringWithFormat:@"Demo%@", @(indexPath.row+1)];
    UIViewController *vc = [[NSClassFromString(str) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    return;
    if (indexPath.row == 0) {
        
        Demo1 *vc = [[Demo1 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (indexPath.row == 1) {
        
        Demo2 *vc = [[Demo2 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (indexPath.row == 2) {
        
        Demo3 *vc = [[Demo3 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }  else if (indexPath.row == 3) {
        
        Demo4 *vc = [[Demo4 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (indexPath.row == 4) {
        
        Demo5 *vc = [[Demo5 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (indexPath.row == 5) {
        Demo6 *vc = [[Demo6 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        Demo7 *vc = [[Demo7 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.textLabel.text = _arr[indexPath.row];
    
    return cell;
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _arr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

#pragma mark - Target Methods


#pragma mark - Private Methods


#pragma mark - Initial Methods
- (void)setupUI {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.tableFooterView = [UIView new];
}

#pragma mark - Setter Getter Methods


#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
