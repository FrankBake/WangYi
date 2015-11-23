//
//  CarouselFingure.h
//  CarouselFingure-无重用版
//
//  Created by lanou3g on 15/8/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CarouselFingure;
@protocol CarouselFingureDelegate<NSObject>


@optional
- (void)carouselFingureDidCarousel:(CarouselFingure *)carouselFingure atIndex:(NSUInteger)index;




@end
@interface CarouselFingure : UIView
//图片数组
@property (nonatomic,retain)NSArray *imagesArray;
//时间间隔
@property (nonatomic,assign)NSTimeInterval duration;
//当前下标
@property (nonatomic,assign)NSUInteger currentIndex;



//代理对象
@property (nonatomic,retain)id<CarouselFingureDelegate>delegate;
@end
