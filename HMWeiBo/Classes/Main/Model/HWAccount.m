//
//  HWAccount.m
//  HMWeiBo
//
//  Created by lychow on 12/17/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWAccount.h"

@interface HWAccount()

@end

@implementation HWAccount
+(instancetype)initWithDict:(NSDictionary *)dict
{
    HWAccount *account =[[self alloc] init];
    account.access_token=dict[@"access_token"];
    account.expires_in=dict[@"expires_in"];
    account.uid =dict[@"uid"];
    account.createAccessTokenDate=[NSDate date];
    
    return account;
}

/**
 *  当一个对象要归档进沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.access_token forKey:@"access_token"];
    [encoder encodeObject:self.expires_in forKey:@"expires_in"];
    [encoder encodeObject:self.uid forKey:@"uid"];
    [encoder encodeObject:self.createAccessTokenDate forKey:@"createAccessTokenDate"];
}

/**
 *  当从沙盒中解档一个对象时（从沙盒中加载一个对象时），就会调用这个方法
 *  目的：在这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.access_token =[decoder decodeObjectForKey:@"access_token"];
        self.expires_in =[decoder decodeObjectForKey:@"expires_in"];
        self.uid =[decoder decodeObjectForKey:@"uid"];
        self.createAccessTokenDate =[decoder decodeObjectForKey:@"createAccessTokenDate"];

    }
    return self;
}




@end
