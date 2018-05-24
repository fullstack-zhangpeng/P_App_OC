//
//  ConstMacro.h
//  CheERong
//
//  Created by 张鹏 on 16/8/9.
//  Copyright © 2016年 zhangpeng. All rights reserved.
//

#ifndef ConstMacro_h
#define ConstMacro_h


#endif /* ConstMacro_h */

//#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
//#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

/** 屏幕尺寸 */
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kOnePixel (1 / [UIScreen mainScreen].scale)

/** 屏幕比例，设计稿为750*1334 */
//#define SCALE_Screen_Width (kScreenW / 375.0f)
//#define SCALE_Screen_Height (kScreenH / 667.0f)
//
//#define AdaptedWidth(x) ceilf((x) * SCALE_Screen_Width)
//#define AdaptedHeight(x) ceilf((x) * SCALE_Screen_Height)

/** 字体*/
#define SYS_FONT(x) [UIFont systemFontOfSize:x]
#define SYS_BOLD_FONT(x) [UIFont boldSystemFontOfSize:x]

// 尺寸
#define is4inches ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define is4_7inches ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define is5_5inches ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define is5_8inches ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 高度
#define kStatusBarHeight (is5_8inches ? 44 : 20)

#define kNavBarHeight 44

#define kTabBarHeight 49

#define kHomeIndicator (is5_8inches ? 34 : 0)

#define kMainAreaHeight kScreenH-kStatusBarHeight-kNavBarHeight-kTabBarHeight-kHomeIndicator

#define kMainAreaHeightNoNav kScreenH-kTabBarHeight-kHomeIndicator

#define kMainAreaHeightNoTab kScreenH-kStatusBarHeight-kNavBarHeight-kHomeIndicator


