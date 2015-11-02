//
//  ShoopingfColumnViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "ShoopingfColumnViewController.h"

@interface ShoopingfColumnViewController ()

@end

@implementation ShoopingfColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingNavigationBar];
}
- (void)settingNavigationBar
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, 0, 60, 40)];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"购物车";
    [self.navigationController.navigationBar setBarTintColor:RGBA(227, 21, 41, 1)];
    self.navigationItem.titleView = label;
}

@end
