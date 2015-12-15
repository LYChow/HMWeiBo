//
//  HWSearchBar.m
//  HMWeiBo
//
//  Created by lychow on 12/15/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWSearchBar.h"

@implementation HWSearchBar

-(id)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        
        self.frame=CGRectMake(10, 10, 300, 30);
        self.background =[UIImage imageNamed:@"searchbar_textfield_background"];
        self.placeholder=@"请搜索想要的内容";
        
        UIImageView *searchImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        searchImageView.contentMode=UIViewContentModeCenter;
        UIImage *searchSignImage =[UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchImageView.image =searchSignImage;
        self.leftView =searchImageView;
        self.leftViewMode=UITextFieldViewModeAlways;
    }
    return self;
    
}

+(instancetype)searchBar
{
    return  [[self alloc] init];
}

@end
