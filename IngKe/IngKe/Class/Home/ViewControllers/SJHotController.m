//
//  SJHotController.m
//  IngKe
//
//  Created by diqiuren on 2016/12/2.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJHotController.h"
#import "SJHomeHandler.h"
#import "SJHotCell.h"

@interface SJHotController ()

@property (nonatomic, strong) NSMutableArray *dataList;

@end

static NSString *cellID = @"SJHotControllerCellID";

@implementation SJHotController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
    [self loadData];
}

- (void)createUI
{
    self.tableView.rowHeight = SCREEN_WIDTH + 70;
}

- (void)loadData
{
    [SJHomeHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
    } failed:nil];
}

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJHotCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[SJHotCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.model = self.dataList[indexPath.row];
    return cell;
}

#pragma mark - 懒加载

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

@end
