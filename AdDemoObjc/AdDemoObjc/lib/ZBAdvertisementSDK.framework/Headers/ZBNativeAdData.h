//
//  ZBNativeAdData.h
//  ZBAdvertisementSDK
//
//  Created by Sean on 2019/3/21.
//  Copyright © 2019 Sean. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBNativeAdData : NSObject
///原生广告，物料编号。取值参见:原生广告物料编号
@property (nonatomic,assign) NSInteger materialId;
///物料类型，取值参见:广告物料格式定义
@property (nonatomic,copy) NSString *type;
///文本物料内容，仅在文本物料返回。
@property (nonatomic,copy) NSString *text;
///物料地址，仅在非文本物料返回。
@property (nonatomic,copy) NSString *url;
///评分，仅在评分物料返回。
@property (nonatomic,assign) NSInteger value;
///物料宽度，仅在图片素材，视频素材返回。
@property (nonatomic,assign) NSInteger w;
///物料高度，仅在图片素材，视频素材返回。
@property (nonatomic,assign) NSInteger h;
///物料时长，单位:秒。仅在视频、音频素材返回。
@property (nonatomic,assign) NSInteger len;
@end

NS_ASSUME_NONNULL_END
