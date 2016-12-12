//
//  SJHomeHandler.m
//  IngKe
//
//  Created by diqiuren on 2016/12/5.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJHomeHandler.h"
#import <MJExtension.h>

@implementation SJHomeHandler

+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTool getWithPath:API_HotLive params:nil success:^(id responseObject) {
//        SJLog(@"%@", responseObject);
        if ([responseObject[@"dm_error"] integerValue]) {
            failed(responseObject);
        } else {
            NSArray * lives = [SJLiveModel mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
            success(lives);
        }
    } failure:failed];
}

@end
