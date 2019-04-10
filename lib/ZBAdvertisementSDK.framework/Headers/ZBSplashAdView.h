//
//  ZBSplashAdView.h
//  ZBAdvertisementSDK
//
//  Created by Sean on 2019/3/21.
//  Copyright © 2019 Sean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBAdDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBSplashAdView : UIView
+ (instancetype)gainSplashAdWithAdId:(NSString *)adId
                                size:(CGSize)size
                    originController:(UIViewController *)originCtrl
                            delegate:(id<ZBAdDelegate>) delegate;;
- (void)loadAd;
@property (nonatomic, assign,readonly,getter=isLoaded) BOOL loaded;
@end

NS_ASSUME_NONNULL_END
