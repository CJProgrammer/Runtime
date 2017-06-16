//
//  ViewController.m
//  GetPropertyIvarMethod
//
//  Created by CJ on 2017/6/16.
//  Copyright © 2017年 CJ. All rights reserved.
//

#import "ViewController.h"
#import "Coder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Coder * coder = [[Coder alloc]init];
    coder.name = @"IAMCJ";
    coder.age = 18;
    [coder setValue:@"北京" forKey:@"_address"];//_address/address均可
    
    // 获取所有的属性
    NSDictionary *propertyDict = [coder getProperties];
    for (NSString *propertyName in propertyDict.allKeys) {
        NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertyDict[propertyName]);
    }
    
    // 获取所有的成员变量
    NSDictionary *ivarDict = [coder getIvars];
    for (NSString *ivarName in ivarDict.allKeys) {
        NSLog(@"ivarName:%@, ivarValue:%@",ivarName, ivarDict[ivarName]);
    }
    
    // 获取所有的方法
    NSDictionary *methodDict = [coder getMethods];
    for (NSString *methodName in methodDict.allKeys) {
        NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodDict[methodName]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
