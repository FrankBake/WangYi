//
//  YuLeHandel.m
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YuLeHandel.h"
#import "YLunBoModel.h"
#import "AFNetworking.h"
#import "YeLeModel.h"

@implementation YuLeHandel


+ (instancetype)shareRequestData
{
    static YuLeHandel * requestData = nil;
    //第一个参数检查block 是不是执行 一次
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        requestData = [[YuLeHandel alloc] init];
    });
    return requestData;
}



#define url1 @"http://c.3g.163.com/nc/article/list/T1348648517839/0-20.html"



-(void)requestScrollData:(void (^)())block
{
    
    //创建url 创建请求
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url1]];
    //******
    //block异步请求过程中,并不会优先执行block内部代码,而是先执行外部代码,等数据处理完了之后block内部代码才结束执行
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //数据处理
        NSArray *array=dict[@"T1348648517839"];
        
        
        for (NSDictionary *dic in array.firstObject[@"ads"]) {
            YLunBoModel *m=[YLunBoModel new];
            [m setValuesForKeysWithDictionary:dic];
            [self.YLunBoArr addObject:m];
            
        }
        
        for (NSDictionary *dic1 in array) {
            YeLeModel *model=[YeLeModel new];
            [model setValuesForKeysWithDictionary:dic1];
            [self.yuLeArr addObject:model];
            
        }
        
        NSLog(@"%@",self.YLunBoArr);
        NSLog(@"+++++++++++++++++%@",self.yuLeArr);
        block();
    }];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:url1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        for (NSDictionary *dic1 in responseObject[@"T1348648517839"][@"ads"]) {
//            
//            YLunBoModel * LunBo = [YLunBoModel new];
//            [LunBo setValuesForKeysWithDictionary:dic1];
//            [self.YLunBoArr addObject:LunBo];
//            
//        }
//        NSLog(@"==================%@",self.YLunBoArr);
//        block();
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    }];
    
    
    
    
}







-(NSMutableArray *)YLunBoArr{
    if (_YLunBoArr==nil) {
        _YLunBoArr=[NSMutableArray array];
    }
    return _YLunBoArr;
}

-(NSMutableArray *)yuLeArr{
    if (_yuLeArr==nil) {
        _yuLeArr=[NSMutableArray array];
    }
    return _yuLeArr;
}


@end
