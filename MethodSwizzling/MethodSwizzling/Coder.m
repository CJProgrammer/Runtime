//
//  Coder.m
//  MethodSwizzling
//
//  Created by CJ on 2017/5/12.
//  Copyright © 2017年 CJ. All rights reserved.
//

#import "Coder.h"
#import <objc/runtime.h>

@implementation Coder

// load方法中线程安全地进行Method Swizzle
+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(eat));
        Method newMethod = class_getInstanceMethod([self class], @selector(sleep));
        
        method_exchangeImplementations(originalMethod, newMethod);
    });
}

// 吃
- (void)eat {
    NSLog(@"程序员正在吃···");
}

// 睡觉
- (void)sleep {
    NSLog(@"程序员正在睡觉···");
}



@end
