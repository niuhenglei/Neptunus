//
//  MainPagefViewController.h
//  Neptunus
//
//  Created by niuhenglei on 15/10/29.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPagefViewController : UIViewController

typedef NS_ENUM(NSInteger, NEMainPageControllerCellType) {
    NEMainPageCellTypeUPcell     = 0,  //上面cell的样式类型
    NEMainPageCellTypeMiddlecell    ,
    NEMainPageCellTypeDowncell      ,
};

@end
