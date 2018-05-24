//
//  NSMutableAttributedString+Safely.h
//  P_App_OC
//
//  Created by zhangpeng on 2018/2/11.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Safely)

- (void)safelyAddAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range;

@end
