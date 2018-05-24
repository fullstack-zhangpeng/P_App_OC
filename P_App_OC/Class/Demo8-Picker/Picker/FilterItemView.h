//
//  FilterItemView.h
//  P_App_OC
//
//  Created by zhangpeng on 2018/2/5.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FilterItemViewDelegate <NSObject>

@optional

@end

@interface FilterItemView : UIView

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIColor *selectedTextColor;

@property (nonatomic, weak) id <FilterItemViewDelegate> delegate;

@end


