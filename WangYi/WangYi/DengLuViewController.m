//
//  DengLuViewController.m
//  WangYi
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "DengLuViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface DengLuViewController ()



@end

@implementation DengLuViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.hidden = NO;

    self.title = @"登录";
    
    
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //view.backgroundColor = [UIColor yellowColor];
    
    UIImage * image = [UIImage imageNamed:@"ca17b5ea7c4a981103e86a1471cd1471.jpg"];
    UIImageView * imgView = [[UIImageView alloc]initWithImage:image];
    imgView.frame = CGRectMake(133, 200, 100, 100);
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //button.backgroundColor = [UIColor blackColor];
    button.frame = CGRectMake(110, 310, 150, 20);
    [button setTitle:@"新浪微博登录" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(didButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [self.view addSubview:imgView];
    
    
    
}








//实现微博登录
- (void)didButton:(UIButton *)sender
{
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        NSLog(@"result = %d",result);
        //if (result == 1) {
            //成功登录后，判断该用户的ID是否在自己的数据库中。
            //如果有直接登录，没有就将该用户的ID和相关资料在数据库中创建新用户。
            //[weakSelf reloadStateWithType:ShareTypeSinaWeibo];
            ShareType type = 0;
            if (sender.tag == 0) {
                type = ShareTypeTencentWeibo;
            }
        //}
    }];
    
    //[ShareSDK cancelAuthWithType:ShareTypeTencentWeibo];

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
