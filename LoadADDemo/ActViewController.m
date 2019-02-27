//
//  ActViewController.m
//  HKHouse591
//
//  Created by addcn591 on 15/9/1.
//  Copyright (c) 2015年 guojian. All rights reserved.
//

#import "ActViewController.h"
#import "Masonry.h"

//狀態欄高度
#define STATUS_BAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)
//導航欄高度
#define NAVIGATION_BAR_HEIGHT 44
//狀態欄 ＋ 導航欄 高度
#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))

@interface ActViewController ()

@end

@implementation ActViewController

- (instancetype)init {
    if (self == [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.webTitle;
    
    //webview init
    UIWebView *webview = [[UIWebView alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]];
    [webview loadRequest:request];
    [self.view addSubview:webview];
    [webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(STATUS_AND_NAVIGATION_HEIGHT, 0, 0, 0));
    }];
}

@end
