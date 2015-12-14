//
//  HWNavigationController.m
//  HMWeiBo
//
//  Created by LY'S MacBook Air on 12/13/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWNavigationController.h"
#include "UIBarItem+Extention.h"
@interface HWNavigationController ()

@end

@implementation HWNavigationController

+(void)initialize
{
   UIBarButtonItem *barItem = [UIBarButtonItem appearance];

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    [super pushViewController:viewController animated:animated];
    
//    UIBarButtonItem *leftBarItem =[UIBarButtonItem initWithBarItemImage:@"navigationbar_back" selectedImage:@"navigationbar_back_highlighted" selector:nil];
// 
//    self.navigationItem.leftBarButtonItem = leftBarItem;
//    
//    UIBarButtonItem *rightBarItem =[UIBarButtonItem initWithBarItemImage:@"navigationbar_more" selectedImage:@"navigationbar_more_highlighted" selector:nil];
//
//    self.navigationItem.rightBarButtonItem =rightBarItem;
  
    UIBarButtonItem *barItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.leftBarButtonItem=barItem;
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
