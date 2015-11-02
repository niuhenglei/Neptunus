//
//  UIImageView+CircleImage.h
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CircleImage)

//frame 的宽高一样
+ (UIImageView *)circleImageWithImageName:(NSString *)imageName viewFrame:(CGRect)frame ;

+ (UIImageView *)circleImageWithImageName:(NSString *)imageName viewFrame:(CGRect)frame borderCorlor:(UIColor *)color borderWidth:(CGFloat)width;

+ (UIImageView *)circleImageWithImage:(UIImage *)image viewFrame:(CGRect)frame ;
@end
