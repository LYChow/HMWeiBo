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
@interface HWHomeViewController ()<dropDownMenuDelegate>
{
HWDropDownMenu *menu;
}

@end

@implementation HWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor =[UIColor whiteColor];

    UIButton *homeBtn =[[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    [homeBtn setTitle:@"首页" forState:UIControlStateNormal];
    [homeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(popDropDownMenuFrom:) forControlEvents:UIControlEventTouchUpInside];
    [homeBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [homeBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    homeBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 80, 0, 0);
    homeBtn.titleEdgeInsets =UIEdgeInsetsMake(0, 0, 0, 30);
    self.navigationItem.titleView =homeBtn;
    
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
