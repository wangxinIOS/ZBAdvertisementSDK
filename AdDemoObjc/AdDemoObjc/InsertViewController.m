//
//  InsertViewController.m
//  AdDemoObjc
//
//  Created by Sean on 2019/4/2.
//  Copyright © 2019 Sean. All rights reserved.
//

#import "InsertViewController.h"
#import <ZBAdvertisementSDK/ZBAdvertisementSDK.h>
#import "ViewController.h"

@interface InsertViewController ()<ZBAdDelegate>
@property (nonatomic, strong) ZBInterstitialAdView *insertAdView;
@property (weak, nonatomic) IBOutlet UIView *bacgView;
@property (nonatomic, assign) BOOL isShow;

@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!self.isShow) {
        self.isShow = YES;
        self.insertAdView = [ZBInterstitialAdView gainInterstitialAdWithAdId:self.adId
                                                                        size:CGSizeMake(250, 250)
                                                            originController:self
                                                                    delegate:self];
        self.insertAdView.frame = CGRectMake((self.bacgView.frame.size.width - 250)/2, 100, 250, 250);
        [self.bacgView addSubview:self.insertAdView];
    }
    
}

- (IBAction)btnAction:(id)sender {
     [self.bacgView removeFromSuperview];
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
    [self.bacgView removeFromSuperview];
}

@end
