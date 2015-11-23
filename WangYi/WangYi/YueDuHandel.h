//
//  YueDuHandel.h
//  WangYi
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YueDuHandel : NSObject

+ (instancetype)shareRequestData;

- (void)requestData:(void(^)())block;

@property (nonatomic, strong) NSMutableArray * yueDuArr;


@end
