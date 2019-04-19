//
//  ZBAdManager.h
//  ZBAdvertisementSDK
//
//  Created by Sean on 2019/3/21.
//  Copyright © 2019 Sean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBAdConfigure.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBAdApi: NSObject


/**
 初始化方法

 @param client clientdId
 @param config 配置信息
 @return api实例
 */
+ (instancetype)gainApiWithClientId:(NSString *)client andConfig:(ZBAdConfigure *)config;

/**
 当前SDK版本

 @return 版本号 eg:1.0
 */
+ (NSString *)version;


/**
 清理缓存，图片资源文件
 */
+ (void)clearAdCache;


@end

NS_ASSUME_NONNULL_END
