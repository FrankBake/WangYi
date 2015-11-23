//
//  TouTiaoTableViewController.m
//  WangYiXinWen
//
//  Created by lanou3g on 15/10/5.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "TouTiaoTableViewController.h"
#import "TouTiaoHandle.h"

#import "TouTiaoModel.h"


#import "TouTiaoTableViewCell.h"
#import "TouTiaoTwoTableViewCell.h"

#import "UIImageView+WebCache.h"
#import "CarouselFingure.h"
#import "LunBoModel.h"

#import "WebViewController.h"

#import <SVPullToRefresh.h>




#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface TouTiaoTableViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)CarouselFingure *cView;


@property (nonatomic,strong)UIPageControl * pageControl;
@property (nonatomic,strong)UIScrollView * scrollView;

@end

@implementation TouTiaoTableViewController








- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset=UIEdgeInsetsMake(10, 0, 50, 0);
    //self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    //IOS8以后
    //self.automaticallyAdjustsScrollViewInsets = NO;
   
  //-------------------------------------------------------------
   
    
    //轮播图
    [[TouTiaoHandle shareRequestData]requestScrollData:^{
        [self.tableView reloadData];
        //[self setCor];
        [self drawView];
    }];
    
    [[TouTiaoHandle shareRequestData]requestData:^{
        [self.tableView reloadData];
    }];
    
    
 
    
    [self.tableView registerClass:[TouTiaoTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView registerClass:[TouTiaoTwoTableViewCell class] forCellReuseIdentifier:@"cell1"];
    
    [self.tableView reloadData];
    
    
    ////////////////////////////////////////////
    
    
    [self setupRefresh];
    
    [self takeAdd];
    
}

//////////////////////////////////////////////////

- (void)setupRefresh
{
    
    __weak typeof(self) weakself = self;
    //下拉刷新
    [self.tableView addPullToRefreshWithActionHandler:^{
        
       // [weakself.tableView reloadData];
        
        [weakself.tableView.pullToRefreshView setTitle:@"不要命的加载中..." forState:SVPullToRefreshStateLoading];
        //weakself.tableView.backgroundColor = [UIColor redColor];
        //[weakself.tableView beginUpdates];
        [[TouTiaoHandle shareRequestData] requestData:^{
            [weakself.tableView reloadData];
        }];
        [weakself performSelector:@selector(refreshTableView) withObject:nil afterDelay:3.0];
        
        //[weakself.tableView endUpdates];
        
        //让table 的动画停止
            //[weakself.tableView.pullToRefreshView stopAnimating];
            
            
        }];
    
    
    
}
-(void)takeAdd
{
  __weak typeof(self) weakself = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
        //参数是一个block .其实就是一个代码盒子
        //每次上拉一次就会执行一次
#define url11 @"http://c.3g.163.com/nc/article/list/T1348647909107/140-20.html"
        //NSArray * array = [url11 componentsSeparatedByString:@"|"];
        
       // NSLog(@"-----------%@",array.lastObject);
        
        //NSArray * url = [array.lastObject  componentsSeparatedByString:@"|"].lastObject;
        
        //图集的请求的操作：//前部图
        //NSURL * url111 = [NSURL URLWithString:[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348647909107/(%d + 20)-20.html",140]];
        
        //self.models.scrollUrl = [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/0096/%@.json",url];
        
           //[weakself.tableView.pullToRefreshView setTitle:@"不要命的加载中..." forState:SVPullToRefreshStateLoading];
        [[TouTiaoHandle shareRequestData] laAction:^{
            [weakself.tableView reloadData];
        }];
        
       [weakself performSelector:@selector(insertDate) withObject:nil afterDelay:5.0];
        // [weakself.tableView.infiniteScrollingView stopAnimating];
        
        
    }];

}
#pragma mark 开始进入刷新状态

- (void)refreshTableView{
    [self.tableView.pullToRefreshView stopAnimating];
    
}

- (void)insertDate
{
    [self.tableView.infiniteScrollingView stopAnimating];
}


//- (void)setCor
//{
//    //实现轮播图
//    NSMutableArray *imagesArray=[[NSMutableArray alloc]initWithCapacity:5];
//    for (int i=0; i<[[TouTiaoHandle shareRequestData] LunBoArr].count; i++) {
//        LunBoModel *model = [[TouTiaoHandle shareRequestData] LunBoArr][i];
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.imgsrc]];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        UIImage *img = [UIImage imageWithData: data];
//        [imagesArray addObject:img];
//    }
//    
//    
//    self.cView=[[CarouselFingure alloc]initWithFrame:CGRectMake(0, 0, 375, 200)];
//    self.cView.imagesArray=imagesArray;
//    self.tableView.tableHeaderView=self.cView;
//}

//实现轮播图
-(void)drawView{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 210)];
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(5, 5, 365, 200)];
    _scrollView.alwaysBounceVertical=NO;
    _scrollView.showsVerticalScrollIndicator=NO;
    _scrollView.contentSize=CGSizeMake(375*[[TouTiaoHandle shareRequestData] LunBoArr].count, 200);
    _scrollView.pagingEnabled=YES;
    for (int i=0; i<[[TouTiaoHandle shareRequestData] LunBoArr].count; i++) {
        LunBoModel *model = [[TouTiaoHandle shareRequestData] LunBoArr][i];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(5, 170, 300, 30)];
        label.text=model.title;
        label.textColor=[UIColor whiteColor];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.imgsrc]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        UIImage *img = [UIImage imageWithData: data];
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(365*i, 5, 365, 200)];
        imgView.image=img;
        [imgView addSubview:label];
        //[imgView setUserInteractionEnabled:YES];
        [self.scrollView addSubview:imgView];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate  =self;
        //self.scrollView.userInteractionEnabled=YES;
   
    }
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(310, 185, 50, 20)];
    //设置页码控制器响应方法
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    //设置总页数
    _pageControl.numberOfPages = [[TouTiaoHandle shareRequestData] LunBoArr].count;
    //设置当前为第一页
    //self.pageControl.currentPage = 0;
    
    //分页效果
    //self.scrollView.pagingEnabled = YES;
    
    
    
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    //self.scrollView.userInteractionEnabled=YES;
    [view addSubview:self.scrollView];
    [view addSubview:self.pageControl];

    self.tableView.tableHeaderView=view;
    
}


- (void)changePage:(UIPageControl *)sender
{
    NSLog(@"当前的索引值:%ld",(long)self.pageControl.currentPage);
    //获取当前页码
    CGRect rect = self.scrollView.frame;
    
    rect.origin.x = self.pageControl.currentPage * self.scrollView.frame.size.width;
    
    rect.origin.y = 0;
    [self.scrollView scrollRectToVisible:rect animated:YES];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //设置当前视图宽度
    self.pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    //self.pageControl.currentPage = scrollView.contentOffset.x/365;
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //NSLog(@"%ld",[[TouTiaoHandle shareRequestData]touTiaoArr].count);
//    if (section == 0) {
//        return [[TouTiaoHandle shareRequestData]touTiaoArr].count;
//    }else{
//        return [[TouTiaoHandle shareRequestData]touTiaoArr1].count;
//    }
    return [[TouTiaoHandle shareRequestData]touTiaoArr].count;
    //return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        return 110;
//    }
//    
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TouTiaoModel * model = [[TouTiaoHandle shareRequestData]touTiaoArr][indexPath.row];
    if (model.imgextra == nil) {
        TouTiaoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        cell.titleLabel.text = model.title;
        
        cell.digesLabel.text = model.digest;
        
        cell.replyCountLabel.text = [NSString stringWithFormat:@"跟帖:%ld",(long)model.replyCount];
        
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        
        return cell;
        
    }else
    {
        TouTiaoTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell.titleLabel.text = model.title;
        
        cell.replyCountLabel.text = [NSString stringWithFormat:@"跟帖:%ld",(long)model.replyCount];
        
        [cell.imgView1 sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        [cell.imgView2 sd_setImageWithURL:[NSURL URLWithString:[model.imgextra[0]objectForKey:@"imgsrc"]]];
        
        [cell.imgView3 sd_setImageWithURL:[NSURL URLWithString:[model.imgextra[1]objectForKey:@"imgsrc"]]];
        
        return cell;
        
    }
    
//    if (indexPath.section == 0 ) {
//        TouTiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//        
//        TouTiaoModel * touTiao = [[TouTiaoHandle shareRequestData]touTiaoArr][indexPath.row];
//        cell.titleLabel.text = touTiao.title;
//        
//        cell.digesLabel.text = touTiao.digest;
//        
//        cell.replyCountLabel.text = [NSString stringWithFormat:@"跟帖:%ld",touTiao.replyCount];
//        
//        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:touTiao.imgsrc]];
//        
//        return cell;
//
//    }else
//    {
//        TouTiaoTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
//        
//        TouTiaoModelTwo * model = [[TouTiaoHandle shareRequestData]touTiaoArr][indexPath.row];
//        cell.titleLabel.text = model.title;
//        cell.replyCountLabel.text = [NSString stringWithFormat:@"跟帖:%ld",model.replyCount];
//        
//        [cell.imgView1 sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
//
//        return cell;
//    }
//    

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TouTiaoModel * model = [[TouTiaoHandle shareRequestData]touTiaoArr][indexPath.row];
    
    WebViewController * webVC = [WebViewController new];
    
    webVC.XiangQing = model.url;
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}

@end
