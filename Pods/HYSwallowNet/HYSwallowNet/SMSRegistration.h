//
//  SMSRegistration.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface SMSRegistration : BaseRequestService

/**
 *  @brief  获取手机短信验证码
 *          400005    手机号已被注册
 *          400006    手机号未注册
 *          400000    请参考msg值
 *  @param telephone 手机号码
 *  @param smsType 1：注册场景；2：登录场景；3：重置密码场景
 *  
 */
- (id)initWithtelephone:(NSString *)telephone 
                smsType:(NSString *)smsType;

@end
