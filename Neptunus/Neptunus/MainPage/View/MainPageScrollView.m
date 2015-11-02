//
//  MainPageScrollView.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "MainPageScrollView.h"


#define IMAGE_HIGEHT 55
#define PAGECONTROL_HEIGHT 10
#define PAGECONTROL_WIDTH 60
#define PADDING 5

@interface MainPageScrollView ()<UIScrollViewDelegate>

@end
@implementation MainPageScrollView


- (MainPageScrollView *)init
{
    if (self = [super init]) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.tag = 2000;
        self.contentSize = CGSizeMake(SCREEN_WIDTH * self.imagesArray.count, IMAGE_HIGEHT);
    }
    return self;
}

- (void)createSubViewsWithView:(UIView *)view
{
    CGRect frame = view.frame;
    self.frame = frame;
    for (int i = 0; i < self.imagesArray.count; i ++) {
        CGFloat imageW = frame.size.width;
        CGFloat imageH = frame.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, imageW, imageH)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imagesArray[i]]];
        
        [self addSubview:imageView];
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-PAGECONTROL_WIDTH)/2, view.frame.size.height-PADDING, PAGECONTROL_WIDTH, PAGECONTROL_HEIGHT)];
    pageControl.numberOfPages = self.imagesArray.count;
    pageControl.tag = 2001;
    
    [view addSubview:self];
    [view addSubview:pageControl];
    
}

@end
