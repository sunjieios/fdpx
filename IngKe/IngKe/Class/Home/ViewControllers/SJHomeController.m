//
//  SJHomeController.m
//  IngKe
//
//  Created by diqiuren on 2016/11/18.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJHomeController.h"
#import "SJFocusController.h"
#import "SJHotController.h"
#import "SJNearController.h"
#import "SJHomeTopView.h"

@interface SJHomeController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) SJHomeTopView *topView;

@property (nonatomic, strong) NSArray *titleArr;

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
    
    self.navigationItem.titleView = self.topView;
    
    for (NSDictionary *dict in self.titleArr) {
        NSString *key = dict.allKeys.lastObject;
        UIViewController *vc = [NSClassFromString(dict[key]) new];
        [self addChildViewController:vc];
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.titleArr.count, 0);
    scrollView.pagingEnabled = YES;
    scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    _scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    // 默认加载主页面，自动调用代理方法
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - UIScrollViewDelegate
// 懒加载控制器
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    [self.topView scrolling:index];
    UIViewController *vc = self.childViewControllers[index];
    // 判断控制器是否加载过
    if ([vc isViewLoaded]) return;
    vc.view.frame = scrollView.bounds;
    vc.view.x = SCREEN_WIDTH * index;
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - 懒加载

- (NSArray *)titleArr
{
    if (_titleArr == nil) {
        _titleArr = @[
                      @{@"关注" : @"SJFocusController"},
                      @{@"热门" : @"SJHotController"},
                      @{@"附近" : @"SJNearController"}
                      ];
    }
    
    return _titleArr;
}

- (SJHomeTopView *)topView
{
    if (_topView == nil) {
        NSMutableArray *titleArr = [NSMutableArray array];
        for (NSDictionary *dict in self.titleArr) {
            [titleArr addObject:dict.allKeys.lastObject];
        }
        @weakify(self)
        _topView = [[SJHomeTopView alloc] initWithFrame:CGRectMake(0, 0, 150, 44) titleArr:titleArr];
        _topView.btnClick = ^ void (NSInteger index) {
            @strongify(self)
            [self.scrollView setContentOffset:CGPointMake(index * self.scrollView.width, 0) animated:YES];
        };
    }
    return _topView;
}

@end
