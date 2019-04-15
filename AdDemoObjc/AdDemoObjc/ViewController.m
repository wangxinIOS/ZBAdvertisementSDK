//
//  ViewController.m
//  AdDemoObjc
//
//  Created by Sean on 2019/3/14.
//  Copyright © 2019 Sean. All rights reserved.
//

#import "ViewController.h"
#import <ZBAdvertisementSDK/ZBAdvertisementSDK.h>
#import "BannerViewController.h"
#import "InsertViewController.h"
#import "NativeViewController.h"

@interface ViewController ()<ZBAdDelegate>

@property (nonatomic, strong) ZBInterstitialAdView *fullScreenAdView;
@property (weak, nonatomic) IBOutlet UITextField *bannerTx;
@property (weak, nonatomic) IBOutlet UITextField *insertTx;
@property (weak, nonatomic) IBOutlet UITextField *nativeTx;
@property (weak, nonatomic) IBOutlet UITextField *fullTx;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)btnAction
{
    [self.fullScreenAdView removeFromSuperview];
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
    [self.fullScreenAdView removeFromSuperview];
}

- (IBAction)fullAdClick:(id)sender
{
    //@"243445"
    self.fullScreenAdView = [ZBInterstitialAdView gainInterstitialAdWithAdId:self.fullTx.text
                                                                        size:self.view.frame.size
                                                            originController:self
                                                                    delegate:self];
    self.fullScreenAdView.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"跳过" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(300, 100, 50, 30);
    [self.fullScreenAdView addSubview:btn];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.fullScreenAdView];
}

//banner广告demo
- (IBAction)banadClick:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     BannerViewController *ctrl = [storyboard instantiateViewControllerWithIdentifier:@"BannerViewController"];
    ctrl.adId = self.bannerTx.text;
    [self.navigationController pushViewController:ctrl animated:YES];
}

//插屏广告demo
- (IBAction)insertClick:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InsertViewController *ctrl = [storyboard instantiateViewControllerWithIdentifier:@"InsertViewController"];
    ctrl.adId = self.insertTx.text;
    [self.navigationController pushViewController:ctrl animated:YES];
}

//原生广告demo
- (IBAction)nativeClick:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NativeViewController *ctrl = [storyboard instantiateViewControllerWithIdentifier:@"NativeViewController"];
    ctrl.adId = self.nativeTx.text;
    [self presentViewController:ctrl animated:YES completion:^{
        
    }];
}

+ (void)showAlert:(NSString *)message controller:(UIViewController *)ctrl {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警  告" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *centain = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:centain];
    [ctrl presentViewController:alert animated:YES completion:nil];
}


@end
