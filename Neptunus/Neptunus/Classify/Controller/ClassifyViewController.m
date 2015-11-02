//
//  ClassifyViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "ClassifyViewController.h"

@interface ClassifyViewController ()
   
@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingNavigationBar];
}
- (void)settingNavigationBar
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, 0, 60, 40)];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"分类";
    [self.navigationController.navigationBar setBarTintColor:RGBA(227, 21, 41, 1)];
    self.navigationItem.titleView = label;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
}
@end
