//
//  ItemCell.m
//  menuDemo
//
//  Created by sun on 2018/12/11.
//  Copyright © 2018年 sunny. All rights reserved.
//

#import "ItemCell.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ItemCell ()

@property (nonatomic, weak)UILabel *label;

@property (nonatomic, weak)UIImageView *imgView;

@end

@implementation ItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    self.label = label;
    label.text = @"说明文字";
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    label.textColor = [UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label];
    label.frame = CGRectMake(15, (52-30)*0.5, ScreenW - 30, 30);
    [self.contentView addSubview:label];
    
    UIImageView *imgView = [UIImageView new];
    self.imgView = imgView;
    [self.contentView addSubview:imgView];
    imgView.frame = CGRectMake(ScreenW - 15 -16, (52-16)*0.5, 16, 16);
    imgView.image = [UIImage imageNamed:@"ic_selected"];
//    imgView.hidden = YES;
    
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(15 ,51 , ScreenW - 30, 0.5);
    line.layer.backgroundColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    [self.contentView addSubview:line];
}

@end
