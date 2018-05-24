//
//  NSDateFormatter+Category.m
//  P_App_OC
//
//  Created by 张鹏 on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "NSDateFormatter+Category.h"

@implementation NSDateFormatter (Category)

+ (NSDateFormatter *)dateFormatterWithString:(NSString *)format {
    
    // 版本2 ，使用当前线程字典来保存对象
    NSMutableDictionary *threadDic = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateFormatter = [threadDic objectForKey:format];
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:format];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormatter setLocale:[NSLocale systemLocale]];
        [threadDic setObject:dateFormatter forKey:format];
    }
    return dateFormatter;
    /*
     版本1.
     static dispatch_once_t onceToken;
     static NSMutableDictionary *formatterDic;
     dispatch_once(&onceToken, ^{
     formatterDic = [NSMutableDictionary dictionaryWithCapacity:8];
     });
     
     NSDateFormatter *dateFormatter_ = [formatterDic objectForKey:format];
     if (dateFormatter_ == nil) {
     @synchronized(formatterDic){
     dateFormatter_ = [NSDateFormatter new];
     dateFormatter_.dateFormat = format;
     [formatterDic setObject:dateFormatter_ forKey:format];
     
     //可能需要设置一些默认属性，防止用户默认的设置造成时间转换问题，这个后续再看
     //            [dateFormatter_ setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
     //            [dateFormatter_ setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
     //            [dateFormatter_ setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
     }
     
     }
     return dateFormatter_;
     */
}

@end
