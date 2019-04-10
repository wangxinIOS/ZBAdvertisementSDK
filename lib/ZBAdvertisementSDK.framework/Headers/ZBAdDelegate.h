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
/*
 fun onAdLoadFailure(code:String,msg:String)
 
 fun onAdLoadSuccess()
 
 fun onAdClick()
*/

@required
- (void)onAdLoadFailure:(NSString *)code msg:(NSString *)msg;
- (void)onAdLoadSuccess;
- (void)onAdClick;

@end

NS_ASSUME_NONNULL_END
