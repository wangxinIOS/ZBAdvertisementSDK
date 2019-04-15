//
//  ZBAdDelegate.h
//  ZBAdvertisementSDK
//
//  Created by Sean on 2019/3/21.
//  Copyright © 2019 Sean. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZBAdDelegate <NSObject>

@required
/**
 广告加载失败

 @param code 错误码
 @param msg 错误信息
 */
- (void)onAdLoadFailure:(NSString *)code msg:(NSString *)msg;

/**
 广告加载成功
 */
- (void)onAdLoadSuccess;

/**
 广告被点击
 */
- (void)onAdClick;

@end

NS_ASSUME_NONNULL_END
