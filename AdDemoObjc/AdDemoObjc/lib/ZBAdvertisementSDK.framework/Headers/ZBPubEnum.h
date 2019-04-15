//
//  ZBPubEnum.h
//  ZBAdvertisementSDK
//
//  Created by Sean on 2019/3/28.
//  Copyright © 2019 Sean. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef ZBPubEnum_h
#define ZBPubEnum_h


///原生广告规范 布局编号
typedef NS_ENUM(NSUInteger, ZBNativeAdLayoutType) {
    ///原生大图
    ZBNativeAdLayoutTypeBigphoto = 1,
    ///原生小图(图右文左)
    ZBNativeAdLayoutTypePhotoRight = 2,
    ///原生小图(图左文右)
    ZBNativeAdLayoutTypePhotoLeft = 3,
    ///原生多图(三图)
    ZBNativeAdLayoutTypeMultiPhoto = 4,
    ///原生视频
    ZBNativeAdLayoutTypeVideo = 5,
    ///原生焦点
    ZBNativeAdLayoutTypeFocus = 6,
};

#endif /* ZBPubEnum_h */
