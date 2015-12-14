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
+(UIBarButtonItem *)initWithBarItemImage:(NSString *)imageName selectedImage:(NSString *)selectedImageName selector:(SEL)selector
{

//    UIButton *itemButton =[UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *image =[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [itemButton setImage:image forState:UIControlStateNormal];
//    [itemButton setImage:selectedImage forState:UIControlStateSelected];
//    itemButton.size =image.size;
//    
//    
//    [itemButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *barItem =[[UIBarButtonItem alloc] initWithCustomView:itemButton];
    UIBarButtonItem *barItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:selector];
    return barItem;
}
@end
