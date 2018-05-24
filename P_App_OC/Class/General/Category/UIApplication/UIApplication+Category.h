//
//  UIApplication+Category.h
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Category)

// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL * _Nonnull documentsURL;
@property (nonatomic, readonly) NSString * _Nonnull documentsPath;

// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL * _Nonnull cachesURL;
@property (nonatomic, readonly) NSString * _Nonnull cachesPath;

// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL * _Nonnull libraryURL;
@property (nonatomic, readonly) NSString * _Nonnull libraryPath;

// "tmp" folder in this app's sandbox.
@property (nonatomic, readonly) NSString * _Nonnull tmpPath;

// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *appBundleName;

// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString *appBundleID;

// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *appVersion;

// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;

@end
