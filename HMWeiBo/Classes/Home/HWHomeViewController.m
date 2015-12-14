//
//  HWHomeViewController.m
//  HMWeiBo
//
//  Created by LY'S MacBook Air on 12/13/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWHomeViewController.h"
#import "HWDiscoverViewController.h"
@interface HWHomeViewController ()

@end

@implementation HWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HWDiscoverViewController *vc =[[HWDiscoverViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
