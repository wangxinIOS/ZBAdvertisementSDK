//
//  ZBBannerAdView.h
//  ZBAdvertisementSDK
//
//  Created by Sean on 2019/3/21.
//  Copyright © 2019 Sean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBAdDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@interface ZBBannerAdView : UIView

+ (instancetype)gainBannerAdWithAdId:(NSString *)adId
                                size:(CGSize)size
                    originController:(UIViewController *)originCtrl;

@property (nonatomic, weak) id<ZBAdDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
