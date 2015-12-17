//
//  HWAccountTool.h
//  HMWeiBo
//
//  Created by lychow on 12/17/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWAccount.h"
@interface HWAccountTool : NSObject

/*!
 *  归档数据到本地沙盒中
 *
 *  @param account 需要归档的model
 */
+(void)archiveToFilePathWithModel:(HWAccount *)account;

/*!
 *  从沙盒中解档数据
 *
 *  @return 数据
 */
+(HWAccount *)account;

@end
