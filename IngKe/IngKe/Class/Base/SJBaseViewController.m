//
//  SJBaseViewController.m
//  IngKe
//
//  Created by diqiuren on 2016/11/17.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJBaseViewController.h"

@interface SJBaseViewController ()

@end

@implementation SJBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor * radomcolor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    self.view.backgroundColor = radomcolor;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
