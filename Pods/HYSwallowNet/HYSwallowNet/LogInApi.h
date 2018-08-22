//
//  LogInApi.h
//  HYSwallow
//
//  Created by Benson on 2018/8/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface LogInApi : BaseRequestService

/**
 *  @brief  用户登录
 *          400001    账号密码错误
 *          400002    手机号码无效
 *          400003    验证码无效
 *          400004    authCode生成异常
 *          400000    其他错误，请参考msg值
 *
 *  @param authType 1：密码登录；2：短信验证码登录
 *  @param credence 手机号码
 *  @param code 密码或短信验证码。注意：密码登录时先将用户名+密码明码进行MD5加密后传入code
 *
 *  @return userId    String    用户ID
 *          token    String    平台颁发的授权令牌，有效期7天
 *          randomKey    String    平台颁发的随机加密盐，用于业务API调用时的签名
 *          authCode    String    平台颁发给Iot平台的授权码，用于IotSDK对Iot平台鉴权
 */
- (id)initWithauthType:(NSString *)authType 
              credence:(NSString *)credence 
                  code:(NSString *)code;

@end
