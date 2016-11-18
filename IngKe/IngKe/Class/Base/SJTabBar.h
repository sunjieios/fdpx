//
//  SJTabBar.h
//  IngKe
//
//  Created by diqiuren on 2016/11/17.
//  Copyright © 2016年 qust. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LiveTypeLeft    =   100,
    LiveTypeRight,
    LiveTypeCenter,
} LiveType;

@interface SJTabBar : UIView

@property (nonatomic, copy) void (^tabbarClicked)(SJTabBar *tabbar, LiveType type);

@end
