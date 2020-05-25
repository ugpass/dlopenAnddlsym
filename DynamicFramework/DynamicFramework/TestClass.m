//
//  TestClass.m
//  DynamicFramework
//
//  Created by demo on 2020/5/25.
//  Copyright © 2020 ls. All rights reserved.
//

#import "TestClass.h"

void CFuncTest() {
    NSLog(@"%s", __func__);
}

@implementation TestClass

+ (void)test {
    NSLog(@"%s", __func__);
}

@end
