//
//  HWAccount.h
//  HMWeiBo
//
//  Created by lychow on 12/17/15.
//  Copyright © 2015 LY'S MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWAccount : NSObject<NSCoding>

/*!
 *  根据code、APPKey 、APPSecret 获得AccessToken
 */
@property(nonatomic, copy) NSString *access_token;

/*!
 *  过期expires tiem   in  seconds
 */
@property(nonatomic,strong) NSNumber  *expires_in;
/*!
 *  即将废弃  过期expires tiem   in  seconds
 */

@property(nonatomic,strong) NSNumber  *remind_in;

/*!
 *  用户的id
 */
@property(nonatomic, copy) NSString *uid;

/*!
 *  生成AccessToken的日期
 */
@property(nonatomic,strong) NSDate  *createAccessTokenDate;

/*!
 *  dictionary------>model

 */
+(instancetype)initWithDict:(NSDictionary *)dict;
@end
