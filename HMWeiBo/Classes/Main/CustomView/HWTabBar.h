//
//  HWTabBar.h
//  HMWeiBo
//
//  Created by lychow on 12/15/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWTabBar;
@protocol tabBarDelegate <UITabBarDelegate>

@optional
-(void)tabBar:(HWTabBar *)tabBar PlusButtonClick:(UIButton *)btn;

@end

@interface HWTabBar : UITabBar

@property(nonatomic,weak) id <tabBarDelegate> delegate;

@end
