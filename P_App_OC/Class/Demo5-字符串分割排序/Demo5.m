//
//  Demo5.m
//  P_App_OC
//
//  Created by 张鹏 on 19/12/2017.
//  Copyright © 2017 zhangpeng. All rights reserved.
//

#import "Demo5.h"

/*
 * 将如下字符串产分成字母为key，数字为value的键值对，按value由小到大输出
 * qqq878123sdasda11231czxczxc72321nmnmc91231
 */

@interface Demo5 ()

@end

@implementation Demo5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"qqq878123sdasda11231czxczxc72321nmnmc91231";
    
    // 初始化一个scanner
    NSScanner *scanner = [NSScanner scannerWithString:str];
    //
    NSLog(@"The string the scanner will scan: %@", scanner.string);
    NSCharacterSet *numSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *letterSet = [NSCharacterSet letterCharacterSet];
    
    NSString *key = [NSString string];
    
    NSString *value = [NSString string];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    while (scanner.isAtEnd == NO) {
        
        if ([scanner scanCharactersFromSet:letterSet intoString:&key]) {
            
            NSLog(@"key: %@", key);
            
        } else {
            
            [scanner scanCharactersFromSet:numSet intoString:&value];
            NSLog(@"value: %@", value);
        }
        
        dic[key] = value;
    }
    
    NSArray *values = [dic allValues];
    values = [values sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [obj1 integerValue] > [obj2 integerValue];
    }];
    
    NSLog(@"values: %@", values);
    
    NSMutableArray *resultArr = [NSMutableArray array];
    for (NSString *value in values) {
        
        [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            if (value == obj) {
                
                NSDictionary *dic = [NSDictionary dictionaryWithObject:obj forKey:key];
                [resultArr addObject:dic];
                NSLog(@"key: %@---value: %@", key, obj);
                *stop = YES;
            }
        }];
    }
    
    NSLog(@"resultArr: %@", resultArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
