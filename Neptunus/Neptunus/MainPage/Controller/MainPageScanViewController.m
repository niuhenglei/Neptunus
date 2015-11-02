//
//  MainPageScanViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/30.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "MainPageScanViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MainScanPopViewController.h"


@interface MainPageScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureMetadataOutput *dataOutput;
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *preView;

@property (nonatomic, strong) UIView *boxView;
@property (nonatomic, strong) UIImageView* lineView;
@end

@implementation MainPageScanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self deveiceSetting];
}
- (void)systemSetting
{
    self.navigationController.toolbar.hidden = YES;
}
- (void)deveiceSetting
{
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    _deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    _dataOutput = [[AVCaptureMetadataOutput alloc] init];
    
    [_dataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    _session = [[AVCaptureSession alloc] init];
    
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    if ([_session canAddInput:self.deviceInput]) {
        [_session addInput:self.deviceInput];
    }
    if ([_session canAddOutput:self.dataOutput]) {
        [_session addOutput:self.dataOutput];
    }
    
    _dataOutput.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
    
    _preView = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    
    _preView.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    //扫描框
    _boxView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 0.2f, self.view.bounds.size.height * 0.2f, self.view.bounds.size.width - self.view.bounds.size.width * 0.4f, self.view.bounds.size.height - self.view.bounds.size.height * 0.4f)];
    _boxView.layer.borderColor = [UIColor greenColor].CGColor;
    _boxView.layer.borderWidth = 1.0f;
    [self.view addSubview:_boxView];
    
    //扫描线
    UIImageView* lineView = [[UIImageView alloc] initWithFrame:CGRectMake(self.boxView.frame.origin.x, self.boxView.frame.origin.y, self.view.bounds.size.width - self.view.bounds.size.width * 0.4f, 1)];
    _lineView = lineView;
    lineView.backgroundColor = [UIColor redColor];
    [self.view addSubview:lineView];
    
    _preView.frame = self.boxView.layer.bounds;
    
    [self.boxView.layer insertSublayer:self.preView atIndex:0];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self lineViewStarting];
    
    [_session startRunning];
}
- (void)lineViewStarting
{
    //扫描线扫描
    
    [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionRepeat animations:^{
        self.lineView.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height - self.view.bounds.size.height * 0.4f);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)lineViewStopping
{
    self.lineView.hidden = YES;
}
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    if ([metadataObjects count ] > 0 )
        
    {
    // 停止扫描
        [ _session stopRunning ];
        [self lineViewStopping];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        stringValue = metadataObject. stringValue ;
        NSLog(@"%@",stringValue);
        
        MainScanPopViewController *scanPop = [[MainScanPopViewController alloc] init];
        
        scanPop.scanValue = stringValue;
        
        [self.navigationController pushViewController:scanPop animated:NO];
    }
}

@end
