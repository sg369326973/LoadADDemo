//
//  AppDelegate.m
//  LoadADDemo
//
//  Created by addcn591 on 2019/2/27.
//  Copyright © 2019 Addcn. All rights reserved.
//

#import "AppDelegate.h"
#import "ADImageView.h"
#import <SDWebImage/SDWebImageManager.h>
#import "ActViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //设置rootView
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *mainTabBar = [main instantiateInitialViewController];
    mainTabBar.selectedIndex = 0;
    self.window.rootViewController = mainTabBar;
    [self.window makeKeyAndVisible];
    
    //加载远程广告
    [self loadAD];
    
    return YES;
}

#pragma mark 加载远程广告 
- (void)loadAD {
    //广告url
    NSString *adImageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486466389044&di=a7ab421bb82bd0d214bbdc5a6b79f2bf&imgtype=0&src=http%3A%2F%2Fpic.qiantucdn.com%2F58pic%2F17%2F80%2F57%2F94s58PICA7j_1024.jpg";
    
    //点击跳转地址
    NSString *adImagePushUrl = @"https://www.baidu.com/";
    
    SDWebImageManager *sdmanage = [SDWebImageManager sharedManager];
    NSURL *adUrl = [NSURL URLWithString:adImageUrl];
    
    //url是否已被缓存
    if ([sdmanage diskImageExistsForURL:adUrl]) {
        UIImage *startADImage = [sdmanage.imageCache imageFromDiskCacheForKey:adImageUrl];
        if (startADImage) {
            //自定义广告ImageView
            ADImageView *launch = [[ADImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            launch.image = startADImage;
            //广告点击跳转
            launch.adPicTapClick = ^{
                ActViewController *acVC = [[ActViewController alloc] init];
                acVC.webUrl = adImagePushUrl;
                acVC.webTitle = @"测试";
                UITabBarController *tabVC = (UITabBarController *)self.window.rootViewController;
                UINavigationController *pushClassStance = (UINavigationController *)tabVC.viewControllers[tabVC.selectedIndex];
                [pushClassStance pushViewController:acVC animated:YES];
            };
            //设置window层级
            [self.window addSubview:launch];
        }
    }
    else {
        //异步下载并缓存以供下次直接读取
        [[SDWebImageManager sharedManager] downloadImageWithURL:adUrl options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {}];
    }
}


@end
