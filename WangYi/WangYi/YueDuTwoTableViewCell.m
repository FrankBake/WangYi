//
//  YueDuTwoTableViewCell.m
//  WangYi
//
//  Created by lanou3g on 15/10/8.
//  Copyright (c) 2015年 庞雪松. All rights reserved.
//

#import "YueDuTwoTableViewCell.h"

@implementation YueDuTwoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    return self;
}


- (void)drawView
{
    
    self.image1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 335, 300)];
    
    self.image2 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 200, 200)];
    
    self.image3 = [[UIImageView alloc]initWithFrame:CGRectMake(210, 5, 120, 98)];
    
    self.image4 = [[UIImageView alloc]initWithFrame:CGRectMake(210, 110, 120, 98)];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 240, 60)];
    self.titleLabel.numberOfLines = 0;
    
    self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 260, 100, 30)];
    self.sourceLabel.textColor = [UIColor grayColor];
    self.sourceLabel.font = [UIFont systemFontOfSize:12];
    //self.sourceLabel.backgroundColor = [UIColor grayColor];
    
    
//    self.imgView.layer.cornerRadius = 8.0;
//    self.imgView.layer.masksToBounds = YES;
    
    [self.image1 addSubview:self.image2];
    [self.image1 addSubview:self.titleLabel];
    [self.image1 addSubview:self.sourceLabel];
    [self.image1 addSubview:self.image3];
    [self.image1 addSubview:self.image4];
    [self.contentView addSubview:self.image1];



}




@end
