//
//  Coder.m
//  GetPropertyIvar
//
//  Created by CJ on 2017/6/16.
//  Copyright © 2017年 CJ. All rights reserved.
//

#import "Coder.h"
#import <objc/runtime.h>

@implementation Coder

// 获取所有的属性
- (NSDictionary *)getProperties {
    
    unsigned int count = 0;
    
    // 获取类的所有 Property，如果没有属性 count 就为0
    objc_property_t * properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        // 获取属性的 Name 和 value
        const char * propertyName = property_getName(properties[i]);
        NSString * name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyValue) {
            dict[name] = propertyValue;
        } else {
            dict[name] = @"value为nil";
        }
    }
    
    // 这里properties是一个数组指针，我们需要使用free函数来释放内存。
    free(properties);
    
    return dict;
}

// 获取所有的成员变量
- (NSDictionary *)getIvars {
    unsigned int count = 0;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 获取类的所有 Ivar
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        // 获取成员变量的 Name 和 value
        const char *varName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:varName];
        id varValue = [self valueForKey:name];
        
        if (varValue) {
            dict[name] = varValue;
        } else {
            dict[name] = @"value为nil";
        }
        
    }
    
    free(ivars);
    
    return dict;
}

// 获取所有的方法
- (NSDictionary *)getMethods {
    unsigned int count = 0;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 获取类的所有 Method
    Method *methods = class_copyMethodList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        // 获取方法 Name
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        
        // 获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        //因为消息发送的时候会有两个默认的参数（消息接受者和方法名），所以需要减去2
        dict[name] = @(arguments-2);
    }
    
    free(methods);
    
    return dict;
}


@end
