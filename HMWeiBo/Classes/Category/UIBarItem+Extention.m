//
//  UIBarItem+Extention.m
//  HMWeiBo
//
//  Created by LY'S MacBook Air on 12/13/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "UIBarItem+Extention.h"
#import "UIView+Extention.h"
@implementation UIBarItem (Extention)
+(UIBarButtonItem *)initWithBarItemImage:(NSString *)imageName selectedImage:(NSString *)selectedImageName target:(id)target action:(SEL)action;
{

    UIButton *itemButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *image =[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [itemButton setImage:image forState:UIControlStateNormal];
    [itemButton setImage:selectedImage forState:UIControlStateSelected];
    UIBarButtonItem *barItem =[[UIBarButtonItem alloc] initWithCustomView:itemButton];
    itemButton.size=image.size;
    
    return barItem;
}
@end
