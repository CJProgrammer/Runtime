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

/*
runtime.h里面的objc_class：
struct objc_class {
    Class isa  OBJC_ISA_AVAILABILITY;
    
#if !__OBJC2__
    Class super_class                                        OBJC2_UNAVAILABLE;
    const char *name                                         OBJC2_UNAVAILABLE;
    long version                                             OBJC2_UNAVAILABLE;
    long info                                                OBJC2_UNAVAILABLE;
    long instance_size                                       OBJC2_UNAVAILABLE;
    struct objc_ivar_list *ivars                             OBJC2_UNAVAILABLE;
    struct objc_method_list **methodLists                    OBJC2_UNAVAILABLE;
    struct objc_cache *cache                                 OBJC2_UNAVAILABLE;
    struct objc_protocol_list *protocols                     OBJC2_UNAVAILABLE;
#endif
    
} OBJC2_UNAVAILABLE;
*/

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
