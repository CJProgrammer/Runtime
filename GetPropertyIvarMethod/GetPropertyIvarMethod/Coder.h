//
//  Coder.h
//  GetPropertyIvar
//
//  Created by CJ on 2017/6/16.
//  Copyright © 2017年 CJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coder : NSObject
{
    NSString * _address;
    NSString * _code;
}

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger age;

/**
 获取所有的属性
 */
- (NSDictionary *)getProperties;

/**
 获取所有的成员变量
 */
- (NSDictionary *)getIvars;

/**
 获取所有的方法
 */
- (NSDictionary *)getMethods;

@end
