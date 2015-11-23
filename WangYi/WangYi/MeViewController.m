//
//  MeViewController.m
//  WangYi
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "MeViewController.h"
#import "DengLuViewController.h"

@interface MeViewController ()
@property(nonatomic,strong)UIView * chouTiView;

@property(nonatomic,strong)UIImageView * imgView;
@end

@implementation MeViewController
@synthesize right;
@synthesize singleRecognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //self.navigationController.navigationBar.hidden = YES;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 180)];
    
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //button.backgroundColor = [UIColor blackColor];
    button.frame = CGRectMake(150, 90, 75, 20);
    [button setTitle:@"立即登录" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(didButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    //添加第二个 照片
    
    [self twoImgeView];
    
    
    //实现抽屉功能
    [self rightView];
    //点击手势
    [self leRecognizer];

  
}


- (void)twoImgeView
{
    UIImageView * twoImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2222.jpg"]];
    
    twoImgView.frame = CGRectMake(0, 180, 375, 100);
    [self.view addSubview:twoImgView];
    
    UIButton * but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but1 setTitle:@"阅读" forState:UIControlStateNormal];
    [but1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //but1.backgroundColor = [UIColor blackColor];
    but1.frame = CGRectMake(20, 60, 50, 20);
    [twoImgView addSubview:but1];
    
    UIButton * but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but2 setTitle:@"收藏" forState:UIControlStateNormal];
    [but2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //but1.backgroundColor = [UIColor blackColor];
    but2.frame = CGRectMake(115, 60, 50, 20);
    [twoImgView addSubview:but2];
    
    UIButton * but3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but3 setTitle:@"跟帖" forState:UIControlStateNormal];
    [but3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //but1.backgroundColor = [UIColor blackColor];
    but3.frame = CGRectMake(210, 60, 50, 20);
    [twoImgView addSubview:but3];
    
    
    UIButton * but4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but4 setTitle:@"金币" forState:UIControlStateNormal];
    [but4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //but1.backgroundColor = [UIColor blackColor];
    but4.frame = CGRectMake(305, 60, 50, 20);
    [twoImgView addSubview:but4];
    
    
}
////添加点击手势实现 向左滑动 出现抽屉 功能
- (void)leRecognizer
{
    self.singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap:)];
    //点击次数
    singleRecognizer.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:singleRecognizer];
}

- (void)SingleTap:(UITapGestureRecognizer *)sender
{
    self.chouTiView.frame = CGRectMake(-375, 280, self.chouTiView.frame.size.width, self.chouTiView.frame.size.height);
}

////添加手势实现 向右滑动 出现抽屉 功能
- (void)rightView
{
    
        self.right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
        
        self.right.direction = UISwipeGestureRecognizerDirectionRight;
        
        [self.view addGestureRecognizer:right];
        
        
    self.view.backgroundColor=[UIColor whiteColor];
        self.chouTiView = [[UIView alloc]initWithFrame:CGRectMake(-375, 280, 375, self.view.frame.size.height)];
    self.chouTiView.backgroundColor=[UIColor whiteColor];



    //self.chouTiView.backgroundColor = [UIColor redColor];
    
    
    //在chouTiView 上添加 图片 在 图片上  添加 label
    
    self.imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1111.jpg"]];

    
    _imgView.frame = CGRectMake(0, 0, 375, 260);
    [self.view addSubview:self.chouTiView];
    [self.chouTiView addSubview:_imgView];
    
//    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 30, 325, 20)];
//    label1.text = @"我的消息";  
//    [imgView addSubview:label1];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"我的消息" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.frame = CGRectMake(40, 25, 100, 20);
    [self.imgView addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"金币商城" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.frame = CGRectMake(40, 77, 100, 20);
    [self.imgView addSubview:button2];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"我的任务" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.frame = CGRectMake(40, 125, 100, 20);
    [self.imgView addSubview:button3];
    
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setTitle:@"我的钱包" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button4.frame = CGRectMake(40, 172, 100, 20);
    [self.imgView addSubview:button4];
    
    UIButton * button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button5 setTitle:@"我的邮箱" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button5.frame = CGRectMake(40, 221, 100, 20);
    [self.imgView addSubview:button5];
    

}


//实现 右滑的抽屉功能

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    [UIView animateWithDuration:0.7 animations:^{
        
        self.chouTiView.frame = CGRectMake(0, 300, self.chouTiView.frame.size.width, self.chouTiView.frame.size.height);
        //self.view.frame=CGRectMake(100, 0, self.view.frame.size.width,self.view.frame.size.height);
        
    }];
}



- (void)didButton
{
    DengLuViewController * dengLuVC = [[DengLuViewController alloc]init];
//    UINavigationController * dengLuNC = [[UINavigationController alloc]initWithRootViewController:dengLuVC];
    [self.navigationController pushViewController:dengLuVC animated:YES];
    
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
