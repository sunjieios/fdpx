//
//  SJTabBar.m
//  IngKe
//
//  Created by diqiuren on 2016/11/17.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJTabBar.h"

@interface SJTabBar ()

@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, strong) NSArray *datalist;
@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation SJTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgView];
        
        for (int i = 0; i < self.datalist.count; i++) {
            NSString *imageStr = self.datalist[i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            // 去除高亮
            btn.adjustsImageWhenHighlighted = NO;
            [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[imageStr stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            btn.tag = 100 + i;
            if (i == 0) {
                btn.selected = YES;
                _selectedBtn = btn;
            }
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)btnClick:(UIButton *)btn
{
    // 改变按钮状态
    _selectedBtn.selected = NO;
    btn.selected = !btn.selected;
    _selectedBtn = btn;
    
    !_tabbarClicked?:_tabbarClicked(self, btn.tag - 100);
    
    // 放大效果
    [UIView animateWithDuration:0.2 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgView.frame = self.bounds;
    CGFloat width = self.frame.size.width / self.datalist.count;
    
    int count = 0;
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake(width * count++, 0, width, self.frame.size.height);
        }
      
    }

}

#pragma mark - 懒加载

- (UIImageView *)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc] init];
        _bgView.image = [UIImage imageNamed:@"global_tab_bg"];
        _bgView.contentMode = UIViewContentModeScaleAspectFill;
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}

- (NSArray *)datalist
{
    if (_datalist == nil) {
        _datalist = @[@"tab_live",@"tab_me"];
    }
    return _datalist;
}

@end
