//
//  ViewController.m
//  MethodSwizzling
//
//  Created by CJ on 2017/5/12.
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
    [coder eat];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
