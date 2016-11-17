//
//  SJBaseTabbarController.m
//  IngKe
//
//  Created by diqiuren on 2016/11/17.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJBaseTabbarController.h"
#import "SJTabBar.h"
#import "SJBaseViewController.h"
#import "SJNavigationController.h"

@interface SJBaseTabbarController ()

@end

@implementation SJBaseTabbarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    NSMutableArray *vcTitleArr = [NSMutableArray arrayWithObjects:@"SJBaseViewController", @"SJBaseViewController", nil];
    for (int i = 0; i < vcTitleArr.count; i++) {
        SJBaseViewController *vc = [[NSClassFromString(vcTitleArr[i]) alloc] init];
        SJNavigationController *nc = [[SJNavigationController alloc] initWithRootViewController:vc];
        [vcTitleArr replaceObjectAtIndex:i withObject:nc];
    }
    
    __weak typeof(self) ws = self;
    /**
     *  自定义tabbar继承UIView，直接覆盖到self.tabbar上，不能直接添加子控制器，否则自定义的tabar
     *  将被UIBarButtonItem覆盖，UIButton将无法被点击
     */
    self.viewControllers = vcTitleArr;
    SJTabBar *tabbar = [[SJTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabbar.tabbarClicked = ^ void(SJTabBar *tabbar, NSInteger index) {
        ws.selectedIndex = index;
    };
    [self.tabBar addSubview:tabbar];
}

@end
