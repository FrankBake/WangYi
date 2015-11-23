//
//  YuLeHandel.h
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YuLeHandel : NSObject


+ (instancetype)shareRequestData;

//解析轮播图
-(void)requestScrollData:(void (^)())block;

//存放轮播图网址
@property (nonatomic,strong)NSMutableArray *YLunBoArr;





@property (nonatomic, strong) NSMutableArray * yuLeArr;






@end
