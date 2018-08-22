//
//  Register.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface Register : BaseRequestService

/**
 *  @brief  用户注册    
 *           400003    验证码无效
 *           400005    手机号已被注册
 *           400000    其他错误，请参考msg值
 *  @param userName 手机号码
 *  @param code 短信验证
 *  @param password 密码，手机号码+密码明码用MD5加密
 *  @param phone 手机电话
 *  @param email 电子邮件
 *  @param nickName 昵称
 *  @param gender 性别，1：男；2：女；0：未知
 *  
 */
- (id)initWithuserName:(NSString *)userName 
                  code:(NSString *)code
              password:(NSString *)password
                 phone:(NSString *)phone
                 email:(NSString *)email
              nickName:(NSString *)nickName
                gender:(NSString *)gender;

@end
