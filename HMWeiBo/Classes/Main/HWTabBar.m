//
//  HWTabBar.m
//  HMWeiBo
//
//  Created by lychow on 12/15/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWTabBar.h"

@interface HWTabBar()
{
    UIButton *plusButton;
}
@end


@implementation HWTabBar

-(id)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        //增加一个添加按钮在tabbar上
        plusButton =[[UIButton alloc] init];

        
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusButton.size=plusButton.currentBackgroundImage.size;
        
        
        [plusButton addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusButton];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置新的tabbar的位置
    CGFloat tabBarWidth =self.width/5;
    NSInteger tabBarIndex= 0;
    for (UIView *subView in self.subviews)
    {
      Class class =  NSClassFromString(@"UITabBarButton");
        if ([subView isKindOfClass:class])
        {
            subView.x =tabBarIndex*tabBarWidth;
            subView.width=tabBarWidth;
            
            tabBarIndex ++;
            if (tabBarIndex==2) {
                plusButton.x =tabBarIndex*tabBarWidth;
                plusButton.width =tabBarWidth;
                tabBarIndex ++;
            }
        }
    }

}


-(void)plusBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabBar: PlusButtonClick:)]) {
        [self.delegate tabBar:self PlusButtonClick:plusButton];
    }
}

@end
