//
//  Demo2.m
//  P_App_OC
//
//  Created by 张鹏 on 2017/10/30.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import "Demo2.h"

@interface Demo2 ()

@end

@implementation Demo2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id arr = [[NSArray alloc] init]; // __NSArray0 *
    NSArray *arr1 = [[NSArray alloc] init]; // __NSArray0 *
    NSArray *arr2 = [[NSArray alloc] initWithObjects:@"1", nil]; // __NSSingleObjectArrayI *
    NSArray *arr3 = @[@"1", @"2"]; // __NSArrayI *
    NSMutableArray *arr4 = [[NSMutableArray alloc] init]; // __NSArrayM *
    
    if ([[arr class] isKindOfClass:[NSArray class]]) {
        
        NSLog(@"true");
        
    } else {
        
        NSLog(@"false");
    }
    
//    id obj1 = [NSArray alloc]; // __NSPlacehodlerArray *
//    id obj2 = [NSMutableArray alloc];  // __NSPlacehodlerArray *
//    id obj3 = [obj1 init];  // __NSArray0 *
//    id obj4 = [obj2 init];  // __NSArrayM *
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
