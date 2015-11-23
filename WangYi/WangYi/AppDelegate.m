//
//  AppDelegate.m
//  WangYi
//
//  Created by lanou3g on 15/10/6.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"

#import <ShareSDK/ShareSDK.h>

#import "WeiboSDK.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =  [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    TabBarViewController * tabBar = [TabBarViewController new];
    
    self.window.rootViewController = tabBar;
    
    [self.window makeKeyAndVisible];
    
    
    
    //1.初始化ShareSDK应用,字符串"4a88b2fb067c"换成你申请的ShareSDK应用的Appkey，这个key来源于ShareSDK官网上申请获得
    [ShareSDK registerApp:@"3df7a36158b2"];
    
    //2.初始化社交平台
    [self initializePlat];
    
    NSLog(@"sharesdkVer:%@",[ShareSDK version]);
    
    
    
    return YES;
}

- (void)initializePlat
{
    //初始化新浪，在新浪微博开放平台上申请应用
    [ShareSDK connectSinaWeiboWithAppKey:@"1437613419" appSecret:@"432b71a8850e3147f1eb4b4fc6e1ffb7" redirectUri:@"http://www.sharesdk.cn" weiboSDKCls:[WeiboSDK class]];

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
