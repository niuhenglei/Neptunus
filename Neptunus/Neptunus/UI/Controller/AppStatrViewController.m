//
//  AppStatrViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "AppStatrViewController.h"
#import "AppDelegate.h"
#import "AppTabBarViewController.h"


#define LAST_IMAGEVIEW_BUTN_WIDTH 80;
#define LAST_IMAGEVIEW_BUTN_HIGHT 40;

@interface AppStatrViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *images;
@end

@implementation AppStatrViewController


#pragma mark - lazyload

- (NSArray *)images
{
    if (!_images) {
        _images = @[@"1",@"2",@"3",@"4"];
    }
    
    return _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showScrollView];
}

- (void)showScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, self.view.frame.size.height);
    scrollView.tag = 1000;
    
    for (int i = 0; i < self.images.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.images[i]]];
        imageView.image = image;
        [scrollView addSubview:imageView];
    }
    
    //初始化UIPageControl 使它和UIScrollView显示在同一界面
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(140, self.view.frame.size.height - 60, 50, 40)];
    pageControl.numberOfPages = 4;
    pageControl.tag = 1001;
    
    [self.view addSubview:scrollView];
    [self.view addSubview:pageControl];
    
}

#pragma mark - UIScrollViewDelegate

//UIScrollView减速结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:1001];
    page.currentPage = current;
    
    if (current == 3) {
        [self creatApplicationPosition];
    }
}
- (void)creatApplicationPosition
{
    [self scrollViewDisappear];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    AppTabBarViewController *tabBarController = [[AppTabBarViewController alloc] init];
    
    app.window.rootViewController = tabBarController;
}
-(void)scrollViewDisappear{
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:1000];
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:1001];
    
    //设置滑动图消失的动画效果图
    [UIView animateWithDuration:3.0f animations:^{
        
        scrollView.center = CGPointMake(self.view.frame.size.width/2, 1.5 * self.view.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [scrollView removeFromSuperview];
        [page removeFromSuperview];
    }];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"YES" forKey:@"isScrollViewAppear"];
}



@end
