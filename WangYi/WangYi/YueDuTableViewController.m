//
//  YueDuTableViewController.m
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YueDuTableViewController.h"
#import "YueDuModel.h"
#import "YueDuHandel.h"
#import "YueduTableViewCell.h"
#import "YueDuTwoTableViewCell.h"
#import "UIImageView+WebCache.h"

#import "WebViewController.h"
#import "AFNetworking.h"


#import "DengLuViewController.h"



@interface YueDuTableViewController ()

//@property(nonatomic,strong)UILabel * label;




@end

@implementation YueDuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.backgroundColor = [UIColor yellowColor];
    
    //添加BUtton
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 50)];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    button.frame = CGRectMake(65, 0, 240, 30);
    [button setTitle:@"立即登录" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(didButton) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button];
    
    
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont fontWithName:@"STHeiti-Medium.ttc" size:6];
    label.text = @"获取更符合口味的推荐";
    label.frame = CGRectMake(100, 33, 240, 25);
    label.textColor = [UIColor grayColor];
    [view addSubview:label];
    self.tableView.tableHeaderView = view;
    
    
    //刷新界面
    [[YueDuHandel shareRequestData]requestData:^{
        [self.tableView reloadData];
    }];
    
    
    [self.tableView registerClass:[YueduTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView registerClass:[YueDuTwoTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView reloadData];
    
    
    ////////////////////////////
   //集成刷新控件
    
//    [self setupRefresh];
    
    
    //上拉 刷新
   
    
    
    
    
    
   
    
}


//上拉 刷新












////集成下拉刷新
//-(void)setupRefresh
//{
//    //1.添加刷新控件
//    UIRefreshControl *control=[[UIRefreshControl alloc]init];
//    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
//    [self.tableView addSubview:control];
//    
//    //2.马上进入刷新状态，并不会触发UIControlEventValueChanged事件
//    [control beginRefreshing];
//    
//    // 3.加载数据
//    [self refreshStateChange:control];
//}
//
//-(void)refreshStateChange:(UIRefreshControl *)control
//{
//    // 3.发送请求
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    [mgr GET:@"http://c.3g.163.com/recommend/getSubDocPic?passport=&devId=352204062119955&size=20&version=5.3.3&from=yuedu&net=wifi" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject){
//        
//        //1.获取数据，处理数据，传递数据给tableView,如：
//        
//        // 将最新的微博数据，添加到总数组的最前面
//        //        NSRange range = NSMakeRange(0, newStatuses.count);
//        //        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
//        //        [self.statuses insertObjects:newStatuses atIndexes:set];
//        
//        //2.刷新表格
//        [self.tableView reloadData];
//        
//        // 3. 结束刷新
//        [control endRefreshing];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        // 结束刷新刷新 ，为了避免网络加载失败，一直显示刷新状态的错误
//        [control endRefreshing];
//    }];
//}



- (void)didButton
{
    DengLuViewController * dengLuVC = [[DengLuViewController alloc]init];
    [self showDetailViewController:dengLuVC sender:nil];
    //[self.navigationController pushViewController:dengLuVC animated:YES];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[YueDuHandel shareRequestData]yueDuArr].count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YueDuModel * model = [[YueDuHandel shareRequestData]yueDuArr][indexPath.row];
    if (model.imgnewextra == nil) {
        return 150;
    }
    
    return 330;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YueDuModel * model = [[YueDuHandel shareRequestData]yueDuArr][indexPath.row];
    
    if (model.imgnewextra == nil) {
        YueduTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.imgView1.image = [UIImage imageNamed:@"01.jpg"];
        cell.titleLabel.text = model.title;
        
        cell.sourceLabel.text = model.source;
        
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        
        
        
        return cell;
    }else
    {
        YueDuTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell.image1.image = [UIImage imageNamed:@"02.gif"];
        cell.titleLabel.text = model.title;
        
        cell.sourceLabel.text = model.source;
        
        [cell.image2 sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        
        [cell.image3 sd_setImageWithURL:[NSURL URLWithString:[model.imgnewextra[0]objectForKey:@"imgsrc"]]];
        [cell.image4 sd_setImageWithURL:[NSURL URLWithString:[model.imgnewextra[1]objectForKey:@"imgsrc"]]];
        
        return cell;
    }
    
}








/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
