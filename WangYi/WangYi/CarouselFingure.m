//
//  CarouselFingure.m
//  CarouselFingure-无重用版
//
//  Created by lanou3g on 15/8/8.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CarouselFingure.h"

@interface CarouselFingure ()<UIScrollViewDelegate>

@property (nonatomic,retain)UIScrollView *scrollView;
@property (nonatomic,retain)UIPageControl *pageControl;
@property (nonatomic,retain)NSTimer *timer;


@end



@implementation CarouselFingure
- (void)dealloc
{
    //[_scrollView release];
    //[_timer release];
    //[_pageControl release];
    //[super dealloc];
}


- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        //创建timer
        _timer=[[NSTimer alloc]init];
        //设置more轮播切换等待时间
        _duration=2;
    }
    return self;
}


#pragma mark --tap手势出发方法--
- (void)tapAction:(UITapGestureRecognizer *)tap{
    NSUInteger index=tap.view.tag-1000;
    //将当前的轮播图和当前轮播图下标传递给外界
    if (_delegate!=nil&&[_delegate respondsToSelector:@selector(carouselFingureDidCarousel:atIndex:)]) {
        [_delegate carouselFingureDidCarousel:self atIndex:index];
    }

}













#pragma mark --代理方法--
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //开始拖动 timer暂停
    [self.timer invalidate];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer=nil;
    //根据人为拖动  调整pageControl的当前页
    self.pageControl.currentPage=self.scrollView.contentOffset.x/self.frame.size.width;
    //修正当前下标
    self.currentIndex=self.pageControl.currentPage;
    //启动timer
    self.timer=[NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(carouselFromTimer:) userInfo:self repeats:YES];
}


#pragma mark --Timer驱动轮播方法--
- (void)carouselFromTimer:(id)sender{
    self.currentIndex++;
    if (self.currentIndex==self.imagesArray.count) {
        self.currentIndex=0;
    }
    self.pageControl.currentPage=self.currentIndex;
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width*self.currentIndex, 0)];
    
    //定时器执行方法的同时,代理将值动态的传递出去(方便外界使用下标)
    [_delegate carouselFingureDidCarousel:self atIndex:self.currentIndex];
}







#pragma mark --赋值方法--

- (void)setImagesArray:(NSArray *)imagesArray{
    //停止timer的操作
    [self.timer invalidate];
    self.timer=nil;

//    if (_imagesArray!=imagesArray) {
//        [_imagesArray release];
//        _imagesArray=[imagesArray retain];
//    }
//    
    [self drawView];
    
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(carouselFromTimer:) userInfo:nil repeats:YES];
}


-(void)setDuration:(NSTimeInterval)duration{
    [self.timer invalidate];
    self.timer=nil;
    _duration=duration;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:_duration target:self selector:@selector(carouselFromTimer:) userInfo:self repeats:YES];
}





#pragma mark --UI绘制--
- (void)drawView{
    //将回执号的视图添加在父视图上
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
}

-(UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]initWithFrame:self.frame];
        _scrollView.pagingEnabled=YES;//整页翻
        _scrollView.showsHorizontalScrollIndicator=NO;//不反弹
        _scrollView.showsVerticalScrollIndicator=NO;
        _scrollView.delegate=self;
        _scrollView.contentSize=CGSizeMake(self.frame.size.width*self.imagesArray.count, self.frame.size.height);
        for (int i=0; i<self.imagesArray.count; i++) {
            UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
            imgView.userInteractionEnabled=YES;
            imgView.image=self.imagesArray[i];
            imgView.tag=1000+i;
            //添加手势
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
            [imgView addGestureRecognizer:tap];
            [_scrollView addSubview:imgView];
        }
    }
    return _scrollView;
}





-(UIPageControl *)pageControl{
    if (_pageControl==nil) {
        _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 100, self.frame.size.width, self.frame.size.height)];
        _pageControl.numberOfPages=self.imagesArray.count;
    }
    return _pageControl;
}












@end
