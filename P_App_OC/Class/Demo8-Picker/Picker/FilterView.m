//
//  FilterView.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/2/4.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "FilterView.h"
#import "UIView+AddProperty.h"

@interface FilterView ()

@property (nonatomic, strong) FilterItemView *currentItemView;

@property (nonatomic, strong) UIView *dataContainerView;

@end

@implementation FilterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectedIndex = -1;
    }
    return self;
}

- (void)hideDataView
{

}

- (void)refreshDataView
{

}

- (void)showDataView
{

}

- (void)clickItem:(UITapGestureRecognizer *)tapG
{
    FilterItemView *itemView = (FilterItemView *)tapG.view;

    if (!_currentItemView) { //_currentItemView不存在
        [self showDataView];
    } else if (_currentItemView == itemView) { //_currentItemView存在且和点击的itemView是同一个
        [self hideDataView];
    } else { //_currentItemView存在且和点击的itemView不是同一个
        [self refreshDataView];
    }

    _currentItemView.selected = NO;
    _currentItemView.text = _texts[_currentItemView.tag];


    itemView.selected = YES;
    _currentItemView = itemView;
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedFilterItem:index:)]) {
        [self.delegate clickedFilterItem:itemView index:itemView.tag];
    }
}

- (void)refreshItem
{
    for (int i = 0; i < _texts.count; i++) {
        CGFloat width = self.frame.size.width/_texts.count;
        CGFloat x = width * i;
        FilterItemView *itemView = nil;
        if (self.delegate && [self.delegate respondsToSelector:@selector(customFilterItemInFilterView:index:)]) {
            itemView = [self.delegate customFilterItemInFilterView:self index:i];
        }
        itemView.frame = CGRectMake(x, 0, width, self.frame.size.height);
        itemView.text = _texts[i];
        itemView.tag = i;
        itemView.selected = (_selectedIndex == i) ? YES : NO;
        [self addSubview:itemView];
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickItem:)];
        [itemView addGestureRecognizer:tapG];
    }
}

#pragma mark - Setter And Getter
- (UIView *)dataContainerView
{
    if (!_dataContainerView) {
        _dataContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, self.width, 200)];
        _dataContainerView.backgroundColor = [UIColor lightGrayColor];
    }
    return _dataContainerView;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (selectedIndex < 0 || selectedIndex > _texts.count) {
        return;
    }
    for (int i = 0; i < self.subviews.count; i++) {
        FilterItemView *itemView = self.subviews[i];
        if (selectedIndex == i) {
            itemView.selected = YES;
            _currentItemView = itemView;
        } else {
            itemView.selected = NO;
        }
    }
}

- (void)setTexts:(NSArray *)texts
{
    _texts = texts;
    [self refreshItem];
}

@end
