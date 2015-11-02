//
//  UIImageView+RectangleImage.m
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import "UIImageView+RectangleImage.h"

@implementation UIImageView (RectangleImage)

+ (UIImageView *)rectangleViewWithImage:(NSString *)imageName viewFrame:(CGRect)frame
{
    CGFloat maxL = frame.size.width > frame.size.height ? frame.size.height : frame.size.width;
    CGFloat minL = frame.size.width < frame.size.height ? frame.size.height : frame.size.width;
    
    CGFloat cornerRadius = maxL/minL*30;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    
    
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
    }
    
    
    return imageView;
}
@end
