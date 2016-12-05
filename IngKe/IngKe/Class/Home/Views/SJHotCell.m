//
//  SJHotCell.m
//  IngKe
//
//  Created by diqiuren on 2016/12/5.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJHotCell.h"
#import "SJLiveModel.h"
#import <Masonry.h>

@interface SJHotCell ()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nickLabel;
@property (nonatomic, weak) UILabel *cityLabel;
@property (nonatomic, weak) UILabel *countLabel;
@property (nonatomic, weak) UIImageView *imageIV;

@end

@implementation SJHotCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    CGFloat margin = 10.f;
    
    UIImageView *iconView = [UIImageView new];
    _iconView = iconView;
    iconView.layer.cornerRadius = 25;
    iconView.layer.masksToBounds = YES;
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.left.top.mas_equalTo(margin);
        make.height.mas_equalTo(iconView.mas_width);
    }];
    
    UILabel *nickLabel = [UILabel new];
    _nickLabel = nickLabel;
    [self.contentView addSubview:nickLabel];
    [nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iconView.mas_right).offset(margin);
        make.top.mas_equalTo(iconView);
    }];
    
    UILabel *cityLabel = [UILabel new];
    _cityLabel = cityLabel;
    cityLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:cityLabel];
    [cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nickLabel);
        make.bottom.mas_equalTo(iconView);
    }];
    
    UILabel *countLabel = [UILabel new];
    _countLabel = countLabel;
    countLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-margin);
        make.top.mas_equalTo(iconView);
    }];
    
    UILabel *seeLabel = [UILabel new];
    seeLabel.textColor = [UIColor lightGrayColor];
    seeLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:seeLabel];
    [seeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(countLabel);
        make.bottom.mas_equalTo(cityLabel);
    }];
    seeLabel.text = @"再看";
    
    UIImageView *imageIV = [UIImageView new];
    _imageIV = imageIV;
    [self.contentView addSubview:imageIV];
    imageIV.contentMode = UIViewContentModeScaleAspectFit;
    [imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iconView.mas_bottom).offset(margin);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_WIDTH);
    }];
    
    UIImageView *seeIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_tag_live"]];
    [imageIV addSubview:seeIV];
    [seeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(- margin * 2);
        make.top.mas_equalTo(margin * 4);
    }];
}

- (void)setModel:(SJLiveModel *)model
{
    if (_model != model) {
        _model = model;
        [self.iconView downloadImage:model.creator.portrait placeholder:@"default_room"];
        self.nickLabel.text = model.creator.nick;
        self.cityLabel.text = model.city;
        self.countLabel.text = [@(model.onlineUsers) stringValue];
        [self.imageIV downloadImage:model.creator.portrait placeholder:@"default_room"];
    }
}

@end
