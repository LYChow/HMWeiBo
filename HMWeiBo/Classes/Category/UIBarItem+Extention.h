//
//  UIBarItem+Extention.h
//  HMWeiBo
//
//  Created by LY'S MacBook Air on 12/13/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarItem (Extention)
+(UIBarButtonItem *)initWithBarItemImage:(NSString *)imageName selectedImage:(NSString *)selectedImageName target:(id)target action:(SEL)action;
@end
