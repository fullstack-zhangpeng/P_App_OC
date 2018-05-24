//
//  FilterView.h
//  P_App_OC
//
//  Created by 张鹏 on 2018/2/4.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FilterItemView.h"

@class FilterView;

@protocol FilterViewDelegate <NSObject>

@optional

- (void)clickedFilterItem:(FilterItemView *)itemView index:(NSInteger)index;

- (FilterItemView *)customFilterItemInFilterView:(FilterView *)filterView index:(NSInteger)index;

@end


@interface FilterView : UIView

@property (nonatomic, weak) id <FilterViewDelegate> delegate;

@property (nonatomic, strong) NSArray *texts;

@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIColor *selectedTextColor;

@property (nonatomic, assign) NSInteger selectedIndex;

@end
