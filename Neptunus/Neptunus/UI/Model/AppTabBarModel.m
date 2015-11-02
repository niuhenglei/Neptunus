//
//  AppTabBarModel.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "AppTabBarModel.h"

@implementation AppTabBarModel
- (id)init{
    self = [super init];
    if (self) {
        NSArray *tabBarNormalImages = @[@"",
                                        @"",
                                        @"",
                                        @"",
                                        @""
                                        ];
        
        _hlTabBarNormalImages = tabBarNormalImages;
        
        
        NSArray *tabBarSelectImages = @[@"",
                                        @"",
                                        @"",
                                        @"",
                                        @""
                                        ];
        _hlTabBarSelectImages = tabBarSelectImages;
        
        NSArray *tabBarNames = @[@"首页",
                                 @"分类",
                                 @"活动",
                                 @"购物车",
                                 @"我的"
                                 ];
        _hlTabBarNames = tabBarNames;
        
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MainPagefViewController *mainPage = [main instantiateViewControllerWithIdentifier:@"MainPagefViewController"];
        
        ClassifyViewController *classify = [main instantiateViewControllerWithIdentifier:@"ClassifyViewController"];
        
        MovementViewController *movement = [main instantiateViewControllerWithIdentifier:@"MovementViewController"];
        
        ShoopingfColumnViewController *shooping = [main instantiateViewControllerWithIdentifier:@"ShoopingfColumnViewController"];
        
        MineCenterViewController *mine = [main instantiateViewControllerWithIdentifier:@"MineCenterViewController"];
        
        NSArray *rootViewControllers = @[mainPage,
                                         classify,
                                         movement,
                                         shooping,
                                         mine
                                         ];
        
        _hlRootControllers = rootViewControllers;
        
        
    }
    return self;
}

@end
