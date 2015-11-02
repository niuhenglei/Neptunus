//
//  MineCenterViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "MineCenterViewController.h"
#import "MineSettingViewController.h"
#import "MineHeadViewCell.h"

@interface MineCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *sectionOneArray;
@property (nonatomic, strong) NSMutableArray *sectionTwoArray;
@property (nonatomic, strong) NSMutableArray *sectionThreeArray;
@property (nonatomic, strong) NSMutableArray *sectionFourArray;
@end

@implementation MineCenterViewController

#pragma mark - lazyload
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        [_dataArray addObjectsFromArray:@[self.sectionOneArray,
                  self.sectionTwoArray,
                  self.sectionThreeArray,
                  self.sectionFourArray
                  ]];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingNavigationBar];
    [self settingTableView];
}
static NSString *headcell_id = @"MineHeadViewCell";
static NSString *defaultcell_id = @"defaultcell";

- (void)settingTableView
{
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_tableView registerNib:[UINib nibWithNibName:@"MineHeadViewCell" bundle:nil] forCellReuseIdentifier:headcell_id];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:defaultcell_id];
    
}
- (void)settingNavigationBar
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30, 0, 60, 40)];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"我的";
//    [self.navigationController.navigationBar setBarTintColor:RGBA(227, 21, 41, 1)];
    self.navigationItem.titleView = label;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(handleLeftBatItem:)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}
- (void)handleLeftBatItem:(UIBarButtonItem *)sender
{
    MineSettingViewController *setting = [[MineSettingViewController alloc] init];
    
    [self.navigationController pushViewController:setting animated:YES];
    
}
#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineHeadViewCell *cell = (MineHeadViewCell *)[tableView dequeueReusableCellWithIdentifier:headcell_id];
    UITableViewCell *cell2 = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:defaultcell_id];
    if (0 == indexPath.section) {
        return cell;
    }
    return cell2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    
    if (section == 0) {
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
    }
    
    return view;
}
@end
