//
//  HWAccountTool.m
//  HMWeiBo
//
//  Created by lychow on 12/17/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import "HWAccountTool.h"

#define HWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]


@implementation HWAccountTool

/*!
 *  归档数据到本地沙盒中
 */
+(void)archiveToFilePathWithModel:(HWAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:HWAccountPath];
}

/*!
 *  从沙盒中解档数据
 *
 *  @return 数据
 */
+(HWAccount *)account
{
    HWAccount *account =[NSKeyedUnarchiver unarchiveObjectWithFile:HWAccountPath];
    
//    NSDate *now =[NSDate date];
//    NSDate *expiresDate =[account.createAccessTokenDate dateByAddingTimeInterval:[account.expires_in integerValue]];
//    
//    //NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
//    if ([expiresDate compare:now] !=NSOrderedDescending) {
//        return nil;
//    }
    return account;
}

@end
