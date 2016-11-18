//
//  SJHomeController.m
//  IngKe
//
//  Created by diqiuren on 2016/11/18.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJHomeController.h"

@interface SJHomeController ()

@end

@implementation SJHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:nil action:nil];
}



@end
