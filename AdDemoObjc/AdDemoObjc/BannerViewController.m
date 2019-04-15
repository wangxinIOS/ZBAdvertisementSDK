//
//  BannerViewController.m
//  AdDemoObjc
//
//  Created by Sean on 2019/4/2.
//  Copyright © 2019 Sean. All rights reserved.
//

#import "BannerViewController.h"
#import <ZBAdvertisementSDK/ZBAdvertisementSDK.h>
#import "ViewController.h"
@interface BannerViewController ()<ZBAdDelegate>
@property (nonatomic, assign) BOOL isShow;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Do any additional setup after loading the view.
    if (!self.isShow) {
        self.isShow = YES;
        ZBBannerAdView *v = [ZBBannerAdView gainBannerAdWithAdId:self.adId
                                                            size:CGSizeMake(self.view.frame.size.width, 55)
                                                originController:self];
        v.frame = CGRectMake(0, 88, v.frame.size.width, v.frame.size.height);
        v.delegate = self;
        [self.view addSubview:v];
    }
    

}

- (void)onAdLoadFailure:(NSString *)code msg:(NSString *)msg
{
    NSString *message = [NSString stringWithFormat:@"code:%@\n msg:%@\n",code,msg];
    [ViewController showAlert:message controller:self];
}

- (void)onAdLoadSuccess
{
    
}

- (void)onAdClick
{

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
