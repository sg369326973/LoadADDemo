//
//  ViewController.m
//  LoadADDemo
//
//  Created by addcn591 on 2019/2/27.
//  Copyright © 2019 Addcn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    test.center = self.view.center;
    test.numberOfLines = 0;
    test.text = @"第一次不会加载广告\n\n退出APP后重新进入~";
    [self.view addSubview:test];
}


@end
