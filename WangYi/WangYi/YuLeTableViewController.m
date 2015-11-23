//
//  YuLeTableViewController.m
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YuLeTableViewController.h"
#import "YuLeHandel.h"
#import "YuLeTableViewCell.h"
#import "YeLeModel.h"

#import "YuLeHandel.h"
#import "YuLeTableViewCell.h"
#import "YuLeTwoTableViewCell.h"

#import "UIImageView+WebCache.h"

@interface YuLeTableViewController ()

@end

@implementation YuLeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //轮播图
    [[YuLeHandel shareRequestData]requestScrollData:^{
        [self.tableView reloadData];
        //[self setCor];
        [self drawView];
    }];
    
    
    [self.tableView registerClass:[YuLeTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView registerClass:[YuLeTwoTableViewCell class] forCellReuseIdentifier:@"cell1"];
    
    [self.tableView reloadData];
    
    
}


- (void)drawView
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 210)];
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(5, 5, 365, 200)];
    scrollView.alwaysBounceVertical=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.contentSize=CGSizeMake(375*[[YuLeHandel shareRequestData] YLunBoArr].count, 200);
    scrollView.pagingEnabled=YES;
    for (int i=0; i<[[YuLeHandel shareRequestData] YLunBoArr].count; i++) {
        YeLeModel *model = [[YuLeHandel shareRequestData] YLunBoArr][i];
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
        [scrollView addSubview:imgView];
        
    }
    [view addSubview:scrollView];
    self.tableView.tableHeaderView=view;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[YuLeHandel shareRequestData]yuLeArr].count;;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 150;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YeLeModel * model = [[YuLeHandel shareRequestData]yuLeArr][indexPath.row];
    
    if (model.imgextra == nil) {
        YuLeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        cell.titleLabel.text = model.title;
        
        cell.digesLabel.text = model.digest;
        
        cell.replyCountLabel.text = [NSString stringWithFormat:@"跟帖:%ld",model.replyCount];
        
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        
        return cell;
        
    }else
    {
        YuLeTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell.titleLabel.text = model.title;
        
        cell.replyCountLabel.text = [NSString stringWithFormat:@"跟帖:%ld",model.replyCount];
        
        [cell.imgView1 sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
        [cell.imgView2 sd_setImageWithURL:[NSURL URLWithString:[model.imgextra[0]objectForKey:@"imgsrc"]]];
        
        [cell.imgView3 sd_setImageWithURL:[NSURL URLWithString:[model.imgextra[1]objectForKey:@"imgsrc"]]];
        
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
