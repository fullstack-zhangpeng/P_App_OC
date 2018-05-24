//
//  TextScrollView.m
//  P_App_OC
//
//  Created by zhangpeng on 01/03/2018.
//  Copyright © 2018 zhangpeng. All rights reserved.
//

#import "TextScrollView.h"

@interface TextScrollView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation TextScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupScrollView];
    }
    return self;
}

- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:scrollView];
    _scrollView = scrollView;
}

- (void)setupLabelsWithTexts:(NSArray *)texts
{
    
}

- (void)startScroll
{

}

- (void)endScroll
{

}

#pragma mark - Setter And Getter
- (void)setTexts:(NSArray *)texts
{
    _texts = texts;
    [self setupLabelsWithTexts:texts];
}

@end
