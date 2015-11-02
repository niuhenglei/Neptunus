//
//  AppTabBarModel.h
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainPagefViewController.h"
#import "ClassifyViewController.h"
#import "MovementViewController.h"
#import "ShoopingfColumnViewController.h"
#import "MineCenterViewController.h"

@interface AppTabBarModel : NSObject

@property (nonatomic, strong) NSArray *hlTabBarNormalImages;///< TabBarController 未选中时图片

@property (nonatomic, strong) NSArray *hlTabBarSelectImages;///< TabBarController 选中后图片

@property (nonatomic, strong) NSArray *hlTabBarNames;///< TabBarController TabBarItem 名字

@property (nonatomic, strong) NSArray *hlRootControllers; ///< TabBarController 控制器


- (id)init;


@end
