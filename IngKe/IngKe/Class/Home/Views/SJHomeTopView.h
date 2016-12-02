//
//  SJHomeTopView.h
//  IngKe
//
//  Created by diqiuren on 2016/12/2.
//  Copyright © 2016年 qust. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJHomeTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr;
- (void)scrolling:(NSInteger)index;

@property (nonatomic, copy) void (^btnClick)(NSInteger index);

@end
