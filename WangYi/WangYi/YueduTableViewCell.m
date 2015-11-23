//
//  YueduTableViewCell.m
//  WangYi
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YueduTableViewCell.h"

@implementation YueduTableViewCell




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    return self;
}


- (void)drawView
{
    self.imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 335, 120)];
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 80)];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 10, 100, 50)];
    self.titleLabel.font=[UIFont systemFontOfSize:14];
    self.titleLabel.numberOfLines=0;
    
    self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 85, 200, 50)];
    self.sourceLabel.textColor = [UIColor grayColor];
    self.sourceLabel.font = [UIFont systemFontOfSize:12];
    //self.sourceLabel.backgroundColor = [UIColor grayColor];
    
    
    self.imgView.layer.cornerRadius = 8.0;
    self.imgView.layer.masksToBounds = YES;
    
    [self.imgView1 addSubview:self.imgView];
    [self.imgView1 addSubview:self.titleLabel];
    [self.imgView1 addSubview:self.sourceLabel];
    [self.contentView addSubview:self.imgView1];
    
//    [self.contentView addSubview:self.imgView];
//    [self.contentView addSubview:self.titleLabel];
//    [self.contentView addSubview:self.sourceLabel];
    
    
    
}









- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
