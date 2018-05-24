//
//  NSMutableAttributedString+AddAttributeStyle.m
//  P_App_OC
//
//  Created by zhangpeng on 2018/2/11.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "NSMutableAttributedString+AddAttributeStyle.h"
#import "NSMutableAttributedString+Safely.h"

@implementation NSMutableAttributedString (AddAttributeStyle)

- (void)addLineWithStyle:(LineStyle)lineStyle range:(NSRange)range
{
    switch (lineStyle) {
        case LineStyleDelete:
        {
            [self safelyAddAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleNone)}
                                range: NSMakeRange(0, self.string.length)];

            [self safelyAddAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                        NSBaselineOffsetAttributeName : @0}
                                range:range];
            break;
        }
        case LineStyleUnder:
        {
            [self safelyAddAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone)}
                                range: NSMakeRange(0, self.string.length)];

            [self safelyAddAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}
                                range:range];
            break;
        }
        default:
            break;
    }
}

@end
