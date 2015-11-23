//
//  TouTiaoHandle.m
//  WangYiXinWen
//
//  Created by lanou3g on 15/10/5.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//


#import "TouTiaoHandle.h"
#import "TouTiaoModel.h"
#import "LunBoModel.h"
#import "AFNetworking.h"


@implementation TouTiaoHandle


+ (instancetype)shareRequestData
{
    static TouTiaoHandle * requestData = nil;
    //第一个参数检查block 是不是执行 一次
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        requestData = [[TouTiaoHandle alloc] init];
    });
    return requestData;
}


#define url1 @"http://c.3g.163.com/nc/article/headline/T1348647909107/0-140.html"

- (void)requestData:(void (^)())block
{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:url1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        for (NSDictionary *dic1 in responseObject[@"T1348647909107"]) {
//            
//            TouTiaoModel * LunBo = [TouTiaoModel new];
//            [LunBo setValuesForKeysWithDictionary:dic1];
//            [self.touTiaoArr addObject:LunBo];
//            
//        }
//        //NSLog(@"==================%@",self.LunBoArr);
//        block();
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    }];
    
        //创建url 创建请求
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url1]];
        //******
        //block异步请求过程中,并不会优先执行block内部代码,而是先执行外部代码,等数据处理完了之后block内部代码才结束执行
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            //解析
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            //数据处理
            NSArray *array=dict[@"T1348647909107"];
            
            
            for (NSDictionary *dic in array) {
                TouTiaoModel *m=[TouTiaoModel new];
                [m setValuesForKeysWithDictionary:dic];
                [self.touTiaoArr addObject:m];
                
    
            }
            
            
            block();
        }];

    
    

}

#define url3 @"http://c.3g.163.com/nc/article/headline/T1348647909107/0-140.html"
//- (void)requestData2:(void(^)())block
//{
//    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url3]];
//    //******
//    //block异步请求过程中,并不会优先执行block内部代码,而是先执行外部代码,等数据处理完了之后block内部代码才结束执行
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        //解析
//        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        //数据处理
//        NSArray *array=dict[@"T1348647909107"];
//        for (NSDictionary *dic in array) {
//            TouTiaoModelTwo *m=[TouTiaoModelTwo new];
//            [m setValuesForKeysWithDictionary:dic];
//            [self.touTiaoArr1 addObject:m];
//        }
//        
//        NSLog(@"++++++++++%@",self.touTiaoArr1);
//        
//        block();
//    }];
//
//}











//解析轮播图
#define url2 @"http://c.m.163.com/nc/ad/headline/0-4.html"

- (void)requestScrollData:(void (^)())block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url2 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *dic1 in responseObject[@"headline_ad"]) {
            
            LunBoModel * LunBo = [LunBoModel new];
            [LunBo setValuesForKeysWithDictionary:dic1];
            [self.LunBoArr addObject:LunBo];
            
        }
        //NSLog(@"==================%@",self.LunBoArr);
        block();
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];

}


//数组懒加载


-(NSMutableArray *)LunBoArr{
    if (_LunBoArr==nil) {
        _LunBoArr=[NSMutableArray array];
    }
    return _LunBoArr;
}


-(NSMutableArray *)touTiaoArr{
    if (_touTiaoArr==nil) {
        _touTiaoArr=[NSMutableArray new];
        
    }
    return _touTiaoArr;
}


//======================la
-(void)laAction:(void(^)())block{
    static int a=140;
    a=a+20;
    
    NSURL * url111 = [NSURL URLWithString:[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348647909107/%d-20.html",a]];
    //创建url 创建请求
    NSURLRequest *request=[NSURLRequest requestWithURL:url111];
    //******
    //block异步请求过程中,并不会优先执行block内部代码,而是先执行外部代码,等数据处理完了之后block内部代码才结束执行
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //数据处理
        NSArray *array=dict[@"T1348647909107"];
        
        
        for (NSDictionary *dic in array) {
            TouTiaoModel *m=[TouTiaoModel new];
            [m setValuesForKeysWithDictionary:dic];
            [self.touTiaoArr addObject:m];
            
            
        }
        
        
        block();
    }];
}


@end
