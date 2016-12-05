//
//  SJHomeHandler.h
//  IngKe
//
//  Created by diqiuren on 2016/12/5.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJBaseHandler.h"
#import "SJLiveModel.h"

@interface SJHomeHandler : SJBaseHandler


/**
  获取热门直播信息

 @param success 成功代码块
 @param failed  失败代码块
 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

@end
