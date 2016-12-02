//
//  SJHomeTopView.m
//  IngKe
//
//  Created by diqiuren on 2016/12/2.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJHomeTopView.h"

@interface SJHomeTopView ()

@property (nonatomic, weak) UIView *lineView;

@end

@implementation SJHomeTopView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger count = titleArr.count;
        CGFloat width = frame.size.width / count;
        CGFloat height = frame.size.height;
        for (NSInteger i = 0; i < count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(width * i, 0, width, height);
            [btn setTitle:titleArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.tag = 10 + i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [btn.titleLabel sizeToFit];
            if (i == 1) {
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 8, btn.titleLabel.width - 2, 2)];
                lineView.centerX = btn.centerX;
                _lineView = lineView;
                lineView.backgroundColor = [UIColor whiteColor];
                [self addSubview:lineView];
            }
        }
    }
    
    return self;
}

- (void)btnClick:(UIButton *)btn
{
    NSInteger index = btn.tag - 10;
    if (_btnClick) {
        _btnClick(index);
    }
    [self scrolling:index];
  
}

- (void)scrolling:(NSInteger)index
{
    UIButton * button = [self viewWithTag:index + 10];
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.centerX = button.centerX;
    }];
}

@end
