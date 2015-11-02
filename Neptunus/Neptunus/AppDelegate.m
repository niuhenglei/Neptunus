//
//  AppDelegate.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "AppDelegate.h"
#import "AppTabBarViewController.h"
#import "AppStatrViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch
    //app启动时动画
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![@"YES" isEqualToString:[defaults objectForKey:@"isScrollViewAppear"]]) {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        AppStatrViewController *scrollViewController = [[AppStatrViewController alloc] init];
        self.window.rootViewController = scrollViewController;
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
    }else{
        AppTabBarViewController *tabBarViewController = [[AppTabBarViewController alloc] init];
        self.window.rootViewController = tabBarViewController;
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
    }
    return YES;
}

- (void)applicationCreatePosition
{
    
}

@end
