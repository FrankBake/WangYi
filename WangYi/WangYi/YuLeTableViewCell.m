//
//  YuLeTableViewCell.m
//  WangYi
//
//  Created by lanou3g on 15/10/7.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YuLeTableViewCell.h"

@implementation YuLeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    return self;
}



- (void)drawView
{
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 120, 120)];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 10, 220, 25)];
    self.titleLabel.font=[UIFont systemFontOfSize:14];
    self.digesLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 40, 180, 50)];
    self.digesLabel.font=[UIFont systemFontOfSize:14];
    self.digesLabel.numberOfLines=0;
    
    self.replyCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 100, 150, 30)];
    self.replyCountLabel.textColor = [UIColor redColor];
    
    self.imgView.layer.cornerRadius = 8.0;
    self.imgView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.digesLabel];
    [self.contentView addSubview:self.replyCountLabel];
    
    
}

















- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
