//
//  UIViewController+Category.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

+ (UIViewController *)currentViewController
{
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    return [UIViewController findBestViewController:viewController];
}

+ (UIViewController*)findBestViewController:(UIViewController*)vc
{
    if (vc.presentedViewController) {
        return [UIViewController findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController* svc = (UISplitViewController*)vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nvc = (UINavigationController*)vc;
        if (nvc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:nvc.topViewController];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tvc = (UITabBarController*)vc;
        if (tvc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:tvc.selectedViewController];
        } else {
            return vc;
        }
    } else {
        return vc;
    }
}

@end
