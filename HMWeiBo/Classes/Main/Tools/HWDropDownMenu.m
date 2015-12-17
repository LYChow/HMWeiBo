//
//  HWDropDownMenu.m
//  HMWeiBo
//
//  Created by lychow on 12/15/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWDropDownMenu.h"

@interface HWDropDownMenu()
@property(nonatomic,strong) UIImageView *containerView;
@end

@implementation HWDropDownMenu


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

+(instancetype)menu
{
    return [[self alloc] init];
}

-(UIImageView *)containerView
{
    if (!_containerView) {
        self.containerView =[[UIImageView alloc] init];
        self.containerView.image =[UIImage imageNamed:@"popover_background"];
        self.containerView.userInteractionEnabled=YES;
    }
    return _containerView;
}

-(void)popDropDownMenuFrom:(UIView *)view
{
    UIWindow *topWindow = [[UIApplication sharedApplication].windows lastObject];

    self.frame = topWindow.bounds;
    self.backgroundColor =[[UIColor redColor] colorWithAlphaComponent:0.3];
    [topWindow addSubview:self];
    
    [self addSubview:self.containerView];
    
    //view以window为坐标系时的坐标
    CGRect newFrame =[view convertRect:view.bounds toView:topWindow];
    self.containerView.y = CGRectGetMaxY(newFrame);
    self.containerView.x = CGRectGetMidX(newFrame)-CGRectGetWidth(self.containerView.frame)/2;
    
    if ([_delegate respondsToSelector:@selector(dropDownMenuDidShow:)]) {
        [_delegate dropDownMenuDidShow:self];
    }
}

-(void)setContentView:(UIView *)contentView
{
    contentView.x=4;
    contentView.y=10;
    self.containerView.width=MIN(CGRectGetWidth(contentView.frame), 217);
    self.containerView.height=contentView.height+20;
    self.containerView.clipsToBounds=YES;
    contentView.width=CGRectGetWidth(self.containerView.frame)-8;
    
    [self.containerView addSubview:contentView];
    
}

-(void)setContentViewController:(UIViewController *)contentViewController
{

}

-(void)dismiss
{
    [self removeFromSuperview];
    if ([_delegate respondsToSelector:@selector(dropDownMenuDidDismiss:)]) {
        [_delegate dropDownMenuDidDismiss:self];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

@end
