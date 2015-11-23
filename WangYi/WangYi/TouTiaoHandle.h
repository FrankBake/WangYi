//
//  TouTiaoHandle.h
//  WangYiXinWen
//
//  Created by lanou3g on 15/10/5.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouTiaoHandle : NSObject




+ (instancetype)shareRequestData;

- (void)requestData:(void(^)())block;

@property (nonatomic, strong) NSMutableArray * touTiaoArr;

//
//- (void)requestData2:(void(^)())block;

//@property (nonatomic, strong) NSMutableArray * touTiaoArr1;





//解析轮播图
-(void)requestScrollData:(void (^)())block;

//存放轮播图网址
@property (nonatomic,strong)NSMutableArray *LunBoArr;

//上拉调用的方法
-(void)laAction:(void(^)())block;

@end
