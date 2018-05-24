//
//  UIApplication+Category.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "UIApplication+Category.h"

@implementation UIApplication (Category)

- (NSURL *)documentsURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)documentsPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)cachesURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)cachesPath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)libraryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)libraryPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)tmpPath
{
    return NSTemporaryDirectory();
}

- (NSString *)appBundleName
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)appBundleID
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)appBuildVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

@end
