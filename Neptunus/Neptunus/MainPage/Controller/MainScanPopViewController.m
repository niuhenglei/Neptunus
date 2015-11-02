//
//  MainScanPopViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/30.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "MainScanPopViewController.h"

@interface MainScanPopViewController ()

@end

@implementation MainScanPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settings];
    [self showStringOfScanValue];
    

}
- (void)settings
{
    self.title = @"扫描结果";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    
    self.navigationController.navigationItem.leftBarButtonItem = item;
}
- (void)showStringOfScanValue
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - SCREEN_WIDTH*0.8f)/2, (SCREEN_HEIGHT - SCREEN_HEIGHT*0.3f)/2, SCREEN_WIDTH*0.8f, SCREEN_HEIGHT*0.3f)];
    label.textColor = [UIColor redColor];
    label.text = self.scanValue;
    label.textAlignment = NSTextAlignmentCenter;
    NSLog(@"%@",self.scanValue);
    [self.view addSubview:label];
}
@end
