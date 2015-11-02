//
//  AppTabBarViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "AppTabBarViewController.h"
#import "AppTabBarModel.h"

@interface AppTabBarViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation AppTabBarViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self custom];
}


- (void)custom{
    AppTabBarModel *model = [[AppTabBarModel alloc]init];
    NSArray *rootViewControllers = model.hlRootControllers;
    NSArray *tabBarNormalImages = model.hlTabBarNormalImages;
    NSArray *tabBarSelectImages = model.hlTabBarSelectImages;
    NSArray *tabBarNames = model.hlTabBarNames;
    NSMutableArray * viewControllers = [NSMutableArray array];
    for (int index = 0; index < rootViewControllers.count; index ++) {
        UINavigationController * navigationViewController = [[UINavigationController alloc] initWithRootViewController:[rootViewControllers  objectAtIndex:index]];
        navigationViewController.interactivePopGestureRecognizer.delegate = self;
        navigationViewController.interactivePopGestureRecognizer.enabled = YES;
        navigationViewController.delegate = self;
        navigationViewController.navigationBarHidden = NO;
        navigationViewController.navigationBar.tintColor = RGBA(227, 21, 41, 1);
        if ([navigationViewController respondsToSelector:@selector(interactivePopGestureRecognizer)]){
            
        }
        
        
        //设置UIImage的渲染方式为UIImageRenderingModeAlwaysOriginal
        UIImage * normalImage = [[UIImage imageNamed:[tabBarNormalImages objectAtIndex:index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIImage * selectImage = [[UIImage imageNamed:[tabBarSelectImages objectAtIndex:index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //不设置title时 设置空值就可以了
        NSString *tabBarName = [tabBarNames objectAtIndex:index];
        
        navigationViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:tabBarName image:normalImage selectedImage:selectImage];
        //        navigationViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(6,0,-6,0);
        navigationViewController.tabBarItem.tag = index;
        //        [navigationViewController.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0,-3)];
        
        
        [viewControllers addObject:navigationViewController];
    }
    
    //设置字体颜色
    UIColor *normalColor = RGBA(255, 255, 255, 1);
    UIColor *selectColor = RGBA(227, 21, 41, 1);
    
    //设置背景颜色
     UIColor *backGroundColor = RGBA(77, 77, 77, 1);
     self.tabBar.barTintColor = backGroundColor;
    
    
    [[UITabBarItem appearance]
     setTitleTextAttributes:
     @{ NSForegroundColorAttributeName : normalColor }
     forState:UIControlStateNormal];
    
    [[UITabBarItem appearance]
     setTitleTextAttributes:
     @{ NSForegroundColorAttributeName :selectColor }
     forState:UIControlStateSelected];
    
    
    
    self.viewControllers = viewControllers;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1 )//关闭主界面的右滑返回
    {
        return NO;
    }
    
    else
        return YES;
}
@end
