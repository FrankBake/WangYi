//
//  WebViewController.m
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView * webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self webView];
}


- (UIWebView *)webView
{
    if (!_webView) {
        
        NSString * urlStr = self.XiangQing;
        
        self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        
        self.webView.delegate = self;
        //自适应大小
        _webView.scalesPageToFit = YES;
        
        self.webView.backgroundColor = [UIColor redColor];
    
        [self.view addSubview:_webView];
        
        NSURL * url = [NSURL URLWithString:urlStr];
        
        NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url];
        
        [self.webView loadRequest:request];
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
