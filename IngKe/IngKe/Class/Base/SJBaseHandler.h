//
//  SJBaseHandler.h
//  IngKe
//
//  Created by diqiuren on 2016/12/5.
//  Copyright © 2016年 qust. All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 *  处理完成事件
 */
typedef void(^CompleteBlock)();

/**
 *  处理事件成功
 *
 *  @param obj 返回数据
 */
typedef void(^SuccessBlock)(id obj);

/**
 *  处理事件失败
 *
 *  @param obj 错误信息
 */

typedef void(^FailedBlock)(id obj);

@interface SJBaseHandler : NSObject


@end
