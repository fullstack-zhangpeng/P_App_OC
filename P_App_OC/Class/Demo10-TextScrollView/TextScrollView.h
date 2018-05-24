//
//  TextScrollView.h
//  P_App_OC
//
//  Created by zhangpeng on 01/03/2018.
//  Copyright © 2018 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextScrollView : UIView

@property (nonatomic, strong) NSArray *texts;

//@property (nonatomic, assign) NSInteger scrollInterval;

- (void)startScroll;

- (void)endScroll;

@end
