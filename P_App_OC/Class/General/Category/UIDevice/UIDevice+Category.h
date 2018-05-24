//
//  UIDevice+Category.h
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Category)

/// Whether the device is iPad/iPad mini.
@property(nonatomic, readonly) BOOL isPad;

/// Whether the device is a simulator.
@property(nonatomic, readonly) BOOL isSimulator;

//设备型号
+ (NSString *)getDeviceModel;
//设备系统版本
+ (NSString *)getDeviceVersion;
//分辨率
+ (NSString *)getResolution;

//运营商
+ (NSString *)getCarrier;

//UUID
+ (NSString *)getUUID;

@end
