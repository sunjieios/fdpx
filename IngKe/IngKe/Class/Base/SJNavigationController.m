//
//  SJNavigationController.m
//  IngKe
//
//  Created by diqiuren on 2016/11/17.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJNavigationController.h"

@interface SJNavigationController ()

@end

@implementation SJNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor colorWithRed:36/255.0 green:215/255.0 blue:200/255.0 alpha:1];
    self.navigationBar.tintColor = [UIColor whiteColor];

    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"global_tittle_bg"] forBarMetrics:UIBarMetricsCompact];
}


@end
