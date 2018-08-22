//
//  RefreshToken.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface RefreshToken : BaseRequestService

/**
 *  @brief  刷新本地请求token
 *          400009    token刷新出错
 *          700001    token过期
 *          700002    token验证失败
 *  @param userId 用户ID
 *  @param token token
 *  
 *  @return randomKey    String    平台颁发的随机加密盐，用于业务API调用时的签名
 *          token    String    平台颁发的授权令牌，有效期7天
 */
- (id)initWithuserId:(NSString *)userId 
               token:(NSString *)token;

@end
