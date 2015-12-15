//
//  HWDropDownMenu.h
//  HMWeiBo
//
//  Created by lychow on 12/15/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWDropDownMenu;
@protocol dropDownMenuDelegate <NSObject>

@optional
-(void)dropDownMenuDidDismiss:(HWDropDownMenu *)menu;
-(void)dropDownMenuDidShow:(HWDropDownMenu *)menu;

@end

@interface HWDropDownMenu : UIView

@property(nonatomic,weak) id <dropDownMenuDelegate> delegate;

+(instancetype)menu;

/*!
 *  销毁
 */
-(void)dismiss;

/*!
 *  pop出控制器以及位置
 *
 *  @param view pop出的内容指向控件
 */
-(void)popDropDownMenuFrom:(UIView *)view;

/*!
 *  设置容器上的内容视图
 */
@property(nonatomic,strong) UIView  *contentView;

/*!
 *  设置容器上的内容控制器
 */
@property(nonatomic,strong) UIViewController  *contentViewController;
@end
