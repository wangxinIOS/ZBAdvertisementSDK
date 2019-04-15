//
//  ZBNativeAd.h
//  ZBAdvertisementSDK
//
//  Created by Sean on 2019/3/21.
//  Copyright © 2019 Sean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBNativeAdData.h"
#import "ZBPubEnum.h"

NS_ASSUME_NONNULL_BEGIN
@class UIViewController;
typedef void(^NativeLoadSuccessBlock)(NSArray<ZBNativeAdData *> *list);
typedef void(^NativeLoadFailBlock)(NSString *code,NSString *msg);

@interface ZBNativeAd : NSObject
+ (instancetype)gainNativeAdWithAdId:(NSString *)adId
                          originCtrl:(UIViewController *)originCtrl
                                type:(ZBNativeAdLayoutType)type
                        successBlock:(NativeLoadSuccessBlock)successBlock
                           fialBlock:(NativeLoadFailBlock)fialBlock;
- (void)onAdShow;
- (void)onAdClick;
@end

NS_ASSUME_NONNULL_END
