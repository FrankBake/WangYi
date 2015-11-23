//
//  TabBarViewController.m
//  WangYiXinWen
//
//  Created by lanou3g on 15/10/5.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "TabBarViewController.h"
//#import "XinWenTableViewController.h"
//#import "YueDuTableViewController.h"
#import "YueDuViewController.h"
#import "ShiTingTableViewController.h"
#import "FaXianTableViewController.h"
#import "MeViewController.h"
#import "XinwenViewController.h"
#import "MeViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //新闻
//    XinWenTableViewController * xinWenVC = [XinWenTableViewController new];
//    UINavigationController * xinWenNC = [[UINavigationController alloc]initWithRootViewController:xinWenVC];
//    xinWenNC.tabBarItem.title = @"新闻";
    //新闻
    XinwenViewController * xinWenVC = [XinwenViewController new];
    UINavigationController * xinWenNC = [[UINavigationController alloc]initWithRootViewController:xinWenVC];
    xinWenNC.tabBarItem.title = @"新闻";
    //标签图片
    xinWenNC.tabBarItem.image = [UIImage imageNamed:nil];
    
    
    //阅读
    YueDuViewController * yueDuVC = [YueDuViewController new];
    UINavigationController * yueDuNC = [[UINavigationController alloc]initWithRootViewController:yueDuVC];
    yueDuNC.tabBarItem.title = @"阅读";
    yueDuNC.tabBarItem.image = [UIImage imageNamed:nil];

    
    //视听
    ShiTingTableViewController * shiTingVC = [ShiTingTableViewController new];
    UINavigationController * shiTingNC = [[UINavigationController alloc]initWithRootViewController:shiTingVC];
    shiTingNC.tabBarItem.title = @"视听";
    shiTingNC.tabBarItem.image = [UIImage imageNamed:nil];
    
    
    //发现
    FaXianTableViewController * faXianVC = [FaXianTableViewController new];
    UINavigationController * faXianNC = [[UINavigationController alloc]initWithRootViewController:faXianVC];
    faXianNC.tabBarItem.title = @"发现";
    faXianNC.tabBarItem.image = [UIImage imageNamed:nil];
    
    //我
    MeViewController * meVC = [MeViewController new];
    UINavigationController * meNC = [[UINavigationController alloc]initWithRootViewController:meVC];
    meNC.tabBarItem.title = @"我";
    meNC.tabBarItem.image = [UIImage imageNamed:nil];
    
    
    //修改字体颜色
    //[meNC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];

    
    NSArray * array = @[xinWenNC,yueDuNC,shiTingNC,faXianNC,meNC];
    self.viewControllers = array;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
