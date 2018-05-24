
//
//  FilterItemView.m
//  P_App_OC
//
//  Created by zhangpeng on 2018/2/5.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "FilterItemView.h"
#import "UIView+AddProperty.h"

@interface FilterItemView ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation FilterItemView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - layoutSubviews

- (void)layoutSubviews {

    CGFloat selfWidth = self.width;
    CGFloat textLabelWidth = _textLabel.width;
    CGFloat arrowImageViewWidth = _arrowImageView.width;

    CGFloat x = (selfWidth - textLabelWidth - arrowImageViewWidth) / 2;

    _textLabel.left = x;
    _textLabel.centerY = self.centerY;
    _arrowImageView.left = _textLabel.right;
    _arrowImageView.centerY = self.centerY;
}

#pragma mark - SetupUI

- (void)setupUI
{
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.userInteractionEnabled = YES;
    [self addSubview:textLabel];
    _textLabel = textLabel;

    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(textLabel.right, textLabel.top, 20, 20)];
    arrowImageView.backgroundColor = [UIColor lightGrayColor];
    arrowImageView.userInteractionEnabled = YES;
    [self addSubview:arrowImageView];
    _arrowImageView = arrowImageView;
}

#pragma mark - Setter
- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    if (selected) {
        if (_selectedTextColor) {
            _textLabel.textColor = _selectedTextColor;
        }
    } else {
        if (_normalTextColor) {
            _textLabel.textColor = _normalTextColor;
        }
    }
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor
{
    _selectedTextColor = selectedTextColor;
    if (_selected) {
        _textLabel.textColor = selectedTextColor;
    } else {
        if (_normalTextColor) {
            _textLabel.textColor = _normalTextColor;
        }
    }
}

- (void)setNormalTextColor:(UIColor *)normalTextColor
{
    _normalTextColor = normalTextColor;
    if (!_selected) {
        _textLabel.textColor = normalTextColor;
    } else {
        if (_selectedTextColor) {
            _textLabel.textColor = _selectedTextColor;
        }
    }
}

- (void)setText:(NSString *)text
{
    _text = text;
    _textLabel.text = text;
    [_textLabel sizeToFit];
}

@end
