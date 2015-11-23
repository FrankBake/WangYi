//
//  YueDuHandel.m
//  WangYi
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YueDuHandel.h"
#import "YueDuModel.h"

@implementation YueDuHandel


+ (instancetype)shareRequestData
{
    static YueDuHandel * requestData = nil;
    //第一个参数检查block 是不是执行 一次
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        requestData = [[YueDuHandel alloc] init];
    });
    return requestData;
}

#define url1 @"http://c.3g.163.com/recommend/getSubDocPic?passport=&devId=352204062119955&size=20&version=5.3.3&from=yuedu&net=wifi"

- (void)requestData:(void (^)())block
{
    //创建URL 创建请求
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url1]];
    
    //block异步请求过程中 并不会优先执行 block 内部代码   而是先执行外部代码,等数据处理完之后block 内部代码才结束执行
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //解析
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        //数据处理
        NSArray * array = dict[@"推荐"];
        
        for (NSDictionary * dic in array) {
            
            YueDuModel * model = [YueDuModel new];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.yueDuArr addObject:model];
        }
        
        NSLog(@"阅读数组:%@",self.yueDuArr);
        
        block();
        
    }];
    
    
}

// 
- (NSMutableArray *)yueDuArr
{
    if (_yueDuArr == nil) {
        _yueDuArr = [NSMutableArray new];
    }
    return _yueDuArr;
}


@end
