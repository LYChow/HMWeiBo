//
//  HWNavigationController.m
//  HMWeiBo
//
//  Created by LY'S MacBook Air on 12/13/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWNavigationController.h"

@interface HWNavigationController ()

@end

@implementation HWNavigationController

+(void)initialize
{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];

    
    NSMutableDictionary *textAttributes =[NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName]=[UIColor orangeColor];
    textAttributes[NSFontAttributeName] =[UIFont systemFontOfSize:13.0];
    [barItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];

    NSMutableDictionary *disableTextAttribute = [NSMutableDictionary dictionary];
    disableTextAttribute[NSForegroundColorAttributeName]=[UIColor grayColor];
    disableTextAttribute[NSFontAttributeName] =[UIFont systemFontOfSize:13.0];
    [barItem setTitleTextAttributes:disableTextAttribute forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    [super pushViewController:viewController animated:animated];
    
    if (self.viewControllers.count>1) {
        UIBarButtonItem *leftBarItem =[UIBarButtonItem initWithBarItemImage:@"navigationbar_back" selectedImage:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        
        viewController.navigationItem.leftBarButtonItem = leftBarItem;
        
        UIBarButtonItem *rightBarItem =[UIBarButtonItem initWithBarItemImage:@"navigationbar_more" selectedImage:@"navigationbar_more_highlighted" target:self action:@selector(more)];
        
        viewController.navigationItem.rightBarButtonItem =rightBarItem;
    }
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

-(void)more
{
    [self popToRootViewControllerAnimated:YES];
}

@end
