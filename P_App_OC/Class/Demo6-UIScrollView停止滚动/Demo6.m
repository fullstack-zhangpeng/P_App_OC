//
//  Demo6.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/12/21.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "Demo6.h"
#import "UIScrollView+Category.h"

@interface Demo6 ()<UIScrollViewDelegate>

@end

@implementation Demo6

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    scrollView.contentSize = CGSizeMake(kScreenW * 8, kScreenH);
    scrollView.delegate = self;
    scrollView.stopScrollBlock = ^(UIScrollView *scrollView) {
        NSLog(@"停止滑动");
    };
    [self.view addSubview:scrollView];
}

/*
 1、快速滚动，自然停止；
 2、快速滚动，手指按压突然停止；
 3、慢速上下滑动停止
 */
#pragma mark - Delegate
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    // 停止类型1、停止类型2
//    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
//    if (scrollToScrollStop) {
//        [self scrollViewDidEndScroll];
//    }
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    if (!decelerate) {
//        // 停止类型3
//        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
//        if (dragToDragStop) {
//            [self scrollViewDidEndScroll];
//        }
//    }
//}
//
//#pragma mark - scrollView 滚动停止
//- (void)scrollViewDidEndScroll {
//
//    NSLog(@"停止滚动了！！！");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
