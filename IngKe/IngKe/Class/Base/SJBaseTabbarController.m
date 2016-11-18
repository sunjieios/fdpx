//
//  SJBaseTabbarController.m
//  IngKe
//
//  Created by diqiuren on 2016/11/17.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJBaseTabbarController.h"
#import "SJTabBar.h"
#import "SJNavigationController.h"
#import "SJHomeController.h"

@interface SJBaseTabbarController ()

@end

@implementation SJBaseTabbarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    NSMutableArray *vcTitleArr = [NSMutableArray arrayWithObjects:@"SJHomeController", @"SJHomeController", nil];
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
    tabbar.tabbarClicked = ^ void(SJTabBar *tabbar, LiveType type) {
        if (type == LiveTypeCenter) {
            NSLog(@"\n%s-----%d", __func__, __LINE__);
        } else {
            ws.selectedIndex = type - LiveTypeLeft;
        }
    };
    [self.tabBar addSubview:tabbar];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

@end
