//
//  HWTitleButton.m
//  HMWeiBo
//
//  Created by lychow on 12/18/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWTitleButton.h"

@implementation HWTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x=0;
    self.imageView.x =CGRectGetWidth(self.titleLabel.frame);
}


-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
