//
//  YueDuViewController.m
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YueDuViewController.h"
#import "YueDuTableViewController.h"
#import "DingYueTableViewController.h"

@interface YueDuViewController ()
@property(nonatomic,strong)UISegmentedControl * sengmentedControl;

@property (nonatomic, strong)YueDuTableViewController * yueDuVC;

@property (nonatomic, strong)DingYueTableViewController * dingYueVC;
@end

@implementation YueDuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    //右按钮
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
    self.navigationItem.rightBarButtonItem = right;
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
    
    [self createSegmentedControl];
    [self createChileViewControllers];
    [_sengmentedControl addTarget:self action:@selector(segmenteAction:) forControlEvents:UIControlEventValueChanged];
}

- (void)createChileViewControllers
{
    _yueDuVC = [[YueDuTableViewController alloc]init];
    
    _dingYueVC = [[DingYueTableViewController alloc]init];
    
    
    [self addChildViewController:_yueDuVC];
    [self addChildViewController:_dingYueVC];
    
    [self.view addSubview:self.yueDuVC.view];
    
    //[self.navigationController.navigationBar addSubview:_yueDuVC.view];
    [self.view bringSubviewToFront:_sengmentedControl];
}

-(void)createSegmentedControl
{
    NSArray * segArray = @[@"推荐阅读",@"我的订阅"];
    
    self.sengmentedControl = [[UISegmentedControl alloc]initWithItems:segArray];
    _sengmentedControl.frame = CGRectMake(5, 0, 120, 40);
    
    _sengmentedControl.selectedSegmentIndex = 0;
    
    [self.navigationController.navigationBar addSubview:_sengmentedControl];
}

- (void)segmenteAction:(UISegmentedControl *)segMC
{
    //NSInteger index = segMC.selectedSegmentIndex;
    switch (segMC.selectedSegmentIndex) {
        case 0:{
//            YueDuTableViewController * yueDuVC = [YueDuTableViewController new];
//            
//            [self.navigationController pushViewController:yueDuVC animated:YES];
            //NSLog(@"%ld",segMC.selectedSegmentIndex);
            if (_yueDuVC.view.superview == nil) {
                [_dingYueVC.view removeFromSuperview];
                [self.view addSubview:_yueDuVC.view];
            }
            [self.view bringSubviewToFront:segMC];
            
        }
            
            break;
        case 1:{
            //NSLog(@"%ld",segMC.selectedSegmentIndex);

//            DingYueTableViewController * dingYueVC = [DingYueTableViewController new];
//            
//            [self.navigationController pushViewController:dingYueVC animated:YES];
            
            if (_dingYueVC.view.superview == nil) {
                [_yueDuVC.view removeFromSuperview];
                [self.view addSubview:_dingYueVC.view];
            }
            [self.view bringSubviewToFront:segMC];
        }
            break;
            
            
        default:
            break;
    }
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
