//
//  UIButton+Category.h
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

@property (nonatomic, assign) NSTimeInterval clickInterval; // 双击间隔

//放大点击范围
- (void)setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

- (void)setEnlargeEdge:(CGFloat) size;

@end
