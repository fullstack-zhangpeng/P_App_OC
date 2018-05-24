//
//  SelectVC.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/2/4.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "Demo8.h"
#import "FilterView.h"

#import "NSMutableAttributedString+Safely.h"
#import "NSMutableAttributedString+AddAttributeStyle.h"

@interface Demo8 ()<FilterViewDelegate>

@end

@implementation Demo8

- (void)viewDidLoad {
    [super viewDidLoad];
    FilterView *filterView = [[FilterView alloc] initWithFrame:CGRectMake(0, 200, kScreenW, 40)];

    filterView.delegate = self;
    filterView.normalTextColor = [UIColor redColor];
    filterView.selectedTextColor = [UIColor greenColor];
//    filterView.selectedIndex = 1;
    [self.view addSubview:filterView];
    filterView.texts = @[@"item1", @"item2", @"item3"];
}

- (FilterItemView *)customFilterItemInFilterView:(FilterView *)filterView index:(NSInteger)index
{
    FilterItemView *itemView = [[FilterItemView alloc] init];
    itemView.normalTextColor = [UIColor redColor];
    itemView.selectedTextColor = [UIColor greenColor];
    return itemView;
}

- (void)clickedFilterItem:(FilterItemView *)itemView index:(NSInteger)index
{
    NSLog(@"clickedFilterItem, index: %@", @(index));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
