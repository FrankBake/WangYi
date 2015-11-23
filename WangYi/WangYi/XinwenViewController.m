//
//  XinwenViewController.m
//  WangYi
//
//  Created by lanou3g on 15/10/6.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "XinwenViewController.h"
#import "SCNavTabBarController.h"
#import "TouTiaoTableViewController.h"
#import "YuLeTableViewController.h"
@interface XinwenViewController ()

@end

@implementation XinwenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"网易";
    
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = right;
    
    //self.title = @"网易";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    TouTiaoTableViewController *oneViewController = [[TouTiaoTableViewController alloc] init];
    oneViewController.title = @"头条";
    //oneViewController.view.backgroundColor = [UIColor brownColor];
    
    YuLeTableViewController *twoViewController = [[YuLeTableViewController alloc] init];
    twoViewController.title = @"娱乐";
    twoViewController.view.backgroundColor = [UIColor redColor];
    
    UIViewController *threeViewController = [[UIViewController alloc] init];
    threeViewController.title = @"热点";
    threeViewController.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *fourViewController = [[UIViewController alloc] init];
    fourViewController.title = @"体育";
    fourViewController.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *fiveViewController = [[UIViewController alloc] init];
    fiveViewController.title = @"北京";
    fiveViewController.view.backgroundColor = [UIColor orangeColor];
    
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, fourViewController, fiveViewController];
    navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
    
    

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
