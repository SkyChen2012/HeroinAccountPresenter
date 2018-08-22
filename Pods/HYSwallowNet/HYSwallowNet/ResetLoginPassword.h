//
//  ResetLoginPassword.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface ResetLoginPassword : BaseRequestService

/**
 *  @brief  重置登录密码
 *          400003    验证码无效
 *          400006    手机号未注册
 *          400000    其他错误，请参考msg值
 * 
 *  @param userName 手机号码
 *  @param code 短信验证码
 *  @param password 密码，手机号码+密码明码用MD5加密
 *  
 */
- (id)initWithuserName:(NSString *)userName 
                  code:(NSString *)code
              password:(NSString *)password;

@end
