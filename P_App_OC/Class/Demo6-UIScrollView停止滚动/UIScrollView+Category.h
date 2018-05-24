//
//  UIScrollView+Category.h
//  P_App_OC
//
//  Created by 张鹏 on 2017/12/22.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^StopScrollBlock)(UIScrollView *scrollView);

@interface UIScrollView (Category)

@property(nonatomic, copy) StopScrollBlock stopScrollBlock;

@end
