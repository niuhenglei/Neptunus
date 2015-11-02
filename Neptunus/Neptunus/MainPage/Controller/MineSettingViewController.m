//
//  MineSettingViewController.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/30.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "MineSettingViewController.h"

@interface MineSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *sectionOneArray;
@property (nonatomic, strong) NSMutableArray *sectionTwoArray;
@end

@implementation MineSettingViewController

#pragma mark - lazyload
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        [_dataArray addObject:self.sectionOneArray];
        [_dataArray addObject:self.sectionTwoArray];
    }
    return _dataArray
    ;
}
- (NSMutableArray *)sectionOneArray
{
    if (!_sectionOneArray) {
        _sectionOneArray = [NSMutableArray array];
        [_sectionOneArray addObjectsFromArray:@[@"非wifi环境下手动下载图片",
                                                @"新浪微博",
                                                @"清楚本地缓存"]];
    }
    return _sectionOneArray;
}
- (NSMutableArray *)sectionTwoArray
{
    if (!_sectionTwoArray) {
        _sectionTwoArray = [NSMutableArray array];
        [_sectionTwoArray addObjectsFromArray:@[@"关于"]];
    }
    return _sectionTwoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}

static NSString *identifier = @"settingcell";

- (void)settings
{
    self.title = @"更多";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    if (indexPath.section == 0) {
        NSArray *array = self.dataArray[indexPath.section];
        cell.textLabel.text = array[indexPath.row];
        if (indexPath.row == 0) {
            [self addSwitch:cell];
        }
        if (indexPath.row == 1) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        if (indexPath.row == 2) {
            [self addLabel:cell];
        }
    }
    if (indexPath.section == 1) {
        NSArray *array = self.dataArray[indexPath.section];
        cell.textLabel.text = array[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
- (void)addSwitch:(UITableViewCell *)cell
{
    UISwitch *switchtype = [[UISwitch alloc] init];
    
    cell.accessoryView = switchtype;
}
- (void)addLabel:(UITableViewCell *)cell
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-80, 10, 80, 30)];
    
    label.text = @"0.0M";
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [UIColor lightGrayColor];
    cell.accessoryView = label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 22;
}
@end
