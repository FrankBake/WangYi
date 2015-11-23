//
//  TouTiaoModel.h
//  WangYiXinWen
//
//  Created by lanou3g on 15/10/5.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TouTiaoModel : NSObject

@property (nonatomic, strong) TouTiaoModel * model;

@property (nonatomic, strong) NSString * imgsrc;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * digest;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, strong) NSArray * imgextra;


@property (nonatomic, strong) NSString * tid;

//详情页面的 属性
@property (nonatomic, strong) NSString * url;

@end
