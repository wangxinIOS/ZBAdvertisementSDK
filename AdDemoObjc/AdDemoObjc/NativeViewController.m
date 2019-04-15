//
//  NativeViewController.m
//  AdDemoObjc
//
//  Created by Sean on 2019/4/2.
//  Copyright © 2019 Sean. All rights reserved.
//

#import "NativeViewController.h"
#import <ZBAdvertisementSDK/ZBAdvertisementSDK.h>
#import "ViewController.h"

@interface NativeViewController ()
@property (nonatomic, strong) ZBNativeAd *nativeAd;
@property (nonatomic, assign) BOOL isShow;

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!self.isShow) {
        self.isShow = YES;
        // Do any additional setup after loading the view.
        __weak __typeof__(self) weakSelf = self;
        self.nativeAd = [ZBNativeAd gainNativeAdWithAdId:self.adId
                                              originCtrl:self
                                                    type:ZBNativeAdLayoutTypeBigphoto successBlock:^(NSArray<ZBNativeAdData *> * _Nonnull list) {
                                                        [weakSelf addSubview:list];
                                                    } fialBlock:^(NSString * _Nonnull code, NSString * _Nonnull msg) {
                                                        NSString *message = [NSString stringWithFormat:@"code:%@\n msg:%@\n",code,msg];
                                                        [ViewController showAlert:message controller:self];
                                                    }];
    }
}

- (void)addSubview:(NSArray<ZBNativeAdData *> *)list {
    [self.nativeAd onAdShow];
    if (list.count > 0) {
        ZBNativeAdData *data = list[0];
        
        UIImageView *headview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 140, 140)];
        headview.userInteractionEnabled = YES;
        NSURL *photourl = [NSURL URLWithString:data.url];
        //url请求实在UI主线程中进行的
        UIImage *images = [UIImage imageWithData:[NSData dataWithContentsOfURL:photourl]];//通过网络url获取uiimage
        headview.image = images;
        [self.view addSubview:headview];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [headview addGestureRecognizer:tap];
    }
}

- (void)tap {
    [self.nativeAd onAdClick];
}
- (IBAction)goback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
