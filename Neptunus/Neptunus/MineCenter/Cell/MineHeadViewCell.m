//
//  MineHeadViewCell.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/30.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "MineHeadViewCell.h"

@interface MineHeadViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;

@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@end
@implementation MineHeadViewCell

- (void)awakeFromNib {
    
    _leftLabel.alpha = 0.5;
    _middleLabel.alpha = 0.5;
    _rightLabel.alpha = 0.5;
}

@end
