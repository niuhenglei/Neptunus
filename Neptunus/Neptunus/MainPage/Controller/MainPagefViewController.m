//
//  MainPagefViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "MainPagefViewController.h"
#import "MainPageScrollView.h"
#import "MainPageScrollView.h"
#import "MainPageScanViewController.h"



@interface MainPagefViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sections;
@property (nonatomic, strong) NSMutableArray *rows;
@property (nonatomic, strong) UIImageView *contentLineOfView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) int currentPage;
@end

@implementation MainPagefViewController

- (IBAction)handleLeftBarItem:(id)sender {
    MainPageScanViewController *mainPageScan = [[MainPageScanViewController alloc] init];
    
    [self.navigationController pushViewController:mainPageScan animated:NO];

}

#pragma mark - lazyload
- (NSMutableArray *)sections
{
    if (!_sections) {
        _sections = [NSMutableArray array];
        [_sections addObject:@"test"];
    }
    return _sections;
}
- (NSMutableArray *)rows
{
    if (!_rows) {
        _rows = [NSMutableArray array];
        [_rows addObjectsFromArray:@[@"tese",@"test"]];
    }
    return _rows;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingNavigationBar];
    [self enrolTableView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _contentLineOfView.hidden = NO;
    _currentPage = 0;
    [self.timer fire];
}

- (void)settingNavigationBar
{
    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, 0, 60, 40)];
    self.searchBar = search;
    _contentLineOfView = [self findHairLineImageViewUnder:self.navigationController.navigationBar];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"6"] forBarMetrics:UIBarMetricsCompact];
    self.navigationItem.titleView = search;
    
}

- (UIImageView *)findHairLineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:[UIImageView class]] && view.frame.size.height<=1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subView in view.subviews) {
        UIImageView *imageView = [self findHairLineImageViewUnder:subView];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

static NSString *identifier = @"mainpagecell";
static NSString *collection_identifier = @"collectioncell";

- (void)enrolTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT+44) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rows.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    if (indexPath.section == NEMainPageCellTypeUPcell && indexPath.row == NEMainPageCellTypeUPcell ) {
        [self handleCellWithCollectionView:cell];
    }
    if (indexPath.row == NEMainPageCellTypeMiddlecell) {
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == NEMainPageCellTypeUPcell) {
        return 140;
    }else if (indexPath.row == NEMainPageCellTypeMiddlecell){
        return 55;
    }
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 144)];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 144)];
    self.scrollView = scrollView;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4,view.frame.size.height);
    scrollView.tag = 1000;
    [scrollView setContentOffset:CGPointZero];
    
    for (int i = 0; i < 4; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, 144)];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        imageView.image = image;
        [scrollView addSubview:imageView];
    }
    
    //初始化UIPageControl 使它和UIScrollView显示在同一界面
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 25,view.frame.size.height - 40, 50, 40)];
    pageControl.numberOfPages = 4;
    pageControl.tag = 1001;
    
    [view addSubview:scrollView];
    [view addSubview:pageControl];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(updateCurrentImageViewDisplay) userInfo:nil repeats:YES];
    
    return view;
}
- (void)updateCurrentImageViewDisplay
{
    self.currentPage += 1;
    if (self.currentPage == 5) {
        self.currentPage = 0;
    }
    [self.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * self.currentPage, 0, SCREEN_WIDTH, 144) animated:YES];
     UIPageControl *page = (UIPageControl *)[self.view viewWithTag:1001];
    page.currentPage = self.currentPage;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 144;
}
- (void)handleCellWithCollectionView:(UITableViewCell *)cell
{
    CGRect collectionViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, 140);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.scrollEnabled = NO;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collection_identifier];
    collectionView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:collectionView];
}
- (void)handleCellWIthScrolleView:(UITableViewCell *)cell
{


}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _contentLineOfView.hidden = YES;
    [UIView animateWithDuration:1 animations:^{
            _searchBar.hidden = YES;
    }];
    [self.view endEditing:YES];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
        _contentLineOfView.hidden = NO;
        _searchBar.hidden = NO;
}
#pragma mark - CollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sections.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collection_identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] init];
    }
    cell.backgroundColor = [UIColor redColor];
    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake(60, 60);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    UIPageControl *pageOne = (UIPageControl *)[self.view viewWithTag:1001];
    UIPageControl *pageTwo = (UIPageControl *)[self.view viewWithTag:2001];
    
    pageOne.currentPage = current ;
    pageTwo.currentPage = current;

}

- (void)dealloc
{
    [self.timer invalidate];
}
@end
