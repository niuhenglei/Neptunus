//
//  AppHeader.h
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#ifndef AppHead_h
#define AppHead_h

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define RGBA(r,g,b,a)  [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

#define STORYBOARD(StoryboardName) [UIStoryboard storyboardWithName:StoryboardName bundle:nil]
#define PUSH_VC_ANIMATED(StoryboardName, ViewControllerName) [self.navigationController pushViewController:\
[STORYBOARD(StoryboardName) instantiateViewControllerWithIdentifier:NSStringFromClass([ViewControllerName class])] \
animated:YES]
#define PUSH_VC_ANIMATED_MAIN(ViewControllerName) [self.navigationController pushViewController:\
[STORYBOARD(@"Main") instantiateViewControllerWithIdentifier:NSStringFromClass([ViewControllerName class])] \
animated:YES]


#define DEFAULT_CORNERRADIUS 4.0f   ///< 默认的按钮圆角



#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
#define IOS7_STATUS_BAR_HEGHT (IS_IOS7 ? 20.0f : 0.0f)

//按钮空隙
#define BUTTONGAP 0
//滑条宽度
#define CONTENTSIZEX 320
//按钮id
#define BUTTONID (sender.tag-100)
//滑动id
#define BUTTONSELECTEDID (self.scrollViewSelectedChannelID - 100)

#define NAVIGATIONBAR_HEIGHT 44
#define TABAR_HEIGHT 49


#endif