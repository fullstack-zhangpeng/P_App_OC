//
//  UIButton+Category.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

@implementation UIButton (Category)

+ (void)load {
    
    Method originMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    SEL originSEL = @selector(sendAction:to:forEvent:);
    Method replaceMethod = class_getInstanceMethod(self, @selector(p_sendAction:to:forEvent:));
    SEL replaceSEL = @selector(p_sendAction:to:forEvent:);
    // 添加方法 语法: BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
    // 若返回YES，说明系统中方法实现不存在，则使用class_replaceMethod函数替换方法的实现；
    // 若返回NO，说明系统中此方法实现已存在，则使用method_exchangeImplementations函数交换方法的实现即可。
    // cls: 被添加方法的类  name: 被添加方法方法名  imp: 被添加方法的实现函数  types: 被添加方法的实现函数的返回值类型和参数类型的字符串
    BOOL didAddMethod = class_addMethod(self, originSEL, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod));
    // 如果系统中该方法已经存在,则替换系统的方法
    // 替换方法 语法: IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
    if (didAddMethod) {
        class_replaceMethod(self, replaceSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        method_exchangeImplementations(originMethod, replaceMethod);
    }
}
#pragma mark - 点击间隔
- (NSTimeInterval)clickInterval {
    return [objc_getAssociatedObject(self, "UIControl_acceptEventInterval") doubleValue];
}

- (void)setClickInterval:(NSTimeInterval)clickInterval {
    objc_setAssociatedObject(self, "UIControl_acceptEventInterval", @(clickInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)currentClickTime {
    return [objc_getAssociatedObject(self, "UIControl_acceptEventTime") doubleValue];
}

- (void)setCurrentClickTime:(NSTimeInterval)currentClickTime {
    objc_setAssociatedObject(self, "UIControl_acceptEventTime", @(currentClickTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)p_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    // 如果想要设置统一的间隔时间，可以在此处加上以下几句
    // 注意，网上有使用 UIControl 分类的，如果使用 UIControl 分类，并且在这里统一设置时间间隔，会影响到其他继承自 UIControl 类的控件，要想统一设置又不想影响其他继承自 UIControl 的控件，建议使用UIButton分类，实现方法都是一样的。
    
    if (self.clickInterval < 0 || !self.clickInterval) {
        self.clickInterval = 1.0; // 如果没有自定义时间间隔，则默认为1秒
    }
    // 是否大于设定的时间间隔(一个按钮在第一次接收到点击事件时，scc_custom_acceptEventTime默认初始化值是0)
    BOOL needSendAction = (NSDate.date.timeIntervalSince1970 - self.currentClickTime >= self.clickInterval);
    // 更新上一次点击时间戳，供与下一次接收点击事件的时间比较使用
    if (self.clickInterval > 0) {
        self.currentClickTime = NSDate.date.timeIntervalSince1970;
    }
    // 两次点击的时间间隔小于设定的时间间隔时，才执行响应事件
    if (needSendAction) {
        [self p_sendAction:action to:target forEvent:event];
    }
}

#pragma mark - 点击区域放大
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdge:(CGFloat) size {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect {
    
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*) event {
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
