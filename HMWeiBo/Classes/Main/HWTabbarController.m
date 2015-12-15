//
//  HWTabbarController.m
//  HMWeiBo
//
//  Created by LY'S MacBook Air on 12/13/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWTabbarController.h"

#import "HWHomeViewController.h"
#import "HWMessageCenterViewController.h"
#import "HWDiscoverViewController.h"
#import "HWProfileViewController.h"
#import "HWNavigationController.h"
#import "HWTabBar.h"

@interface HWTabbarController () <tabBarDelegate>

@end

@implementation HWTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    HWHomeViewController *homeVC =[[HWHomeViewController alloc] init];
    [self setTabBarItemWithChildVC:homeVC title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    HWMessageCenterViewController *messageCenterVC =[[HWMessageCenterViewController alloc] init];
    [self setTabBarItemWithChildVC:messageCenterVC title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    
    HWDiscoverViewController *discoverVC =[[HWDiscoverViewController alloc] init];
    [self setTabBarItemWithChildVC:discoverVC title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    HWProfileViewController *profileVC =[[HWProfileViewController alloc] init];
    [self setTabBarItemWithChildVC:profileVC title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    HWTabBar *tabBar =[[HWTabBar alloc] init];
    tabBar.delegate =self;
     //通过KVC设置tabbar的属性为自定义的tabbar
    [self setValue:tabBar forKeyPath:@"tabBar"];

}

-(void)setTabBarItemWithChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image  selectedImage:(NSString *)selectedImage;
{
 
    childVC.title=title;
    UITabBarItem *tabbarItem =[[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    childVC.tabBarItem =tabbarItem;

    
     HWNavigationController *nav =[[HWNavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
    
}

-(void)tabBar:(HWTabBar *)tabBar PlusButtonClick:(UIButton *)btn
{

}
@end
