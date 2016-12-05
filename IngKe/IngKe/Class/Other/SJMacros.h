//
//  SJMacros.h
//  IngKe
//
//  Created by diqiuren on 2016/11/17.
//  Copyright © 2016年 qust. All rights reserved.
//

#ifndef SJMacros_h
#define SJMacros_h

// 输入日志
#ifdef DEBUG
#define SJLog(...) NSLog(@"%s %d \n \n%@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__ ])
#else
#define SJLog(...)
#endif

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height




#endif /* SJMacros_h */
