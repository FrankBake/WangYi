//
//  YuLeTwoTableViewCell.m
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YuLeTwoTableViewCell.h"

@implementation YuLeTwoTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    return self;
}



- (void)drawView
{
    self.imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 100, 100)];
    self.imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(125, 30, 100, 100)];
    
    self.imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(240, 30, 100, 100)];
    
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 230, 25)];
    self.titleLabel.font=[UIFont systemFontOfSize:14];
    
    self.replyCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 0, 120, 30)];
    
    
    self.imgView1.layer.cornerRadius = 8.0;
    self.imgView1.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imgView1];
    
    self.imgView2.layer.cornerRadius = 8.0;
    self.imgView2.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imgView2];
    
    self.imgView3.layer.cornerRadius = 8.0;
    self.imgView3.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imgView3];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.replyCountLabel];
    self.replyCountLabel.textColor = [UIColor redColor];
    
    
}















- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
