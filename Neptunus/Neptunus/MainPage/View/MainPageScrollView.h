//
//  MainPageScrollView.h
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPageScrollView : UIScrollView

@property (nonatomic, strong) NSMutableArray *imagesArray;

- (MainPageScrollView *)init;
- (void)createSubViewsWithView:(UIView *)view;
@end
