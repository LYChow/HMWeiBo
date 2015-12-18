//
//  HWHomeViewController.m
//  HMWeiBo
//
//  Created by LY'S MacBook Air on 12/13/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWHomeViewController.h"
#import "HWDiscoverViewController.h"
#import "HWSearchBar.h"
#import "HWDropDownMenu.h"
#import "HWTitleButton.h"
@interface HWHomeViewController ()<dropDownMenuDelegate>
{
HWDropDownMenu *menu;
}

@end

@implementation HWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor =[UIColor whiteColor];
     
    HWTitleButton *titleButton =[[HWTitleButton alloc] init];
    titleButton.backgroundColor =[UIColor redColor];
    [titleButton setTitle:@"111111" forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(dropMenuStatusChange:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    
}

-(void)dropMenuStatusChange:(UIButton *)btn
{

    btn.selected=!btn.self.selected;
}

-(void)popDropDownMenuFrom:(UIView *)view
{
    menu =[HWDropDownMenu menu];
    menu.delegate=self;
    UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    btn.backgroundColor=[UIColor redColor];
    menu.contentView=btn;
    [menu popDropDownMenuFrom:view];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HWDiscoverViewController *vc =[[HWDiscoverViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -dropDownMenuDelegate
-(void)dropDownMenuDidShow:(HWDropDownMenu *)menu
{
    UIButton *titleBtn =(UIButton *)self.navigationItem.titleView;
    titleBtn.selected=YES;
}

-(void)dropDownMenuDidDismiss:(HWDropDownMenu *)menu
{
    UIButton *titleBtn =(UIButton *)self.navigationItem.titleView;
    titleBtn.selected=NO;
}

@end
