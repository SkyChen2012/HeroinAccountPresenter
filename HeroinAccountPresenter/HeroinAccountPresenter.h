//
//  HeroinAccountPresenter.h
//  HeroinAccountPresenter
//
//  Created by Benson on 2018/8/17.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HeroinAccountPresenter <NSObject>

/**
 *  @brief  清楚状态
 */
- (void)clear;


@end

@protocol LoginView <HeroinAccountPresenter>

/**
 *  @brief clear Text
 */
- (void)onClearText;

/**
 *  @brief  登陆返回结果
 *
 *  @param result 网络回传数据
 *  @param code Http code       
 */
- (void)onLoginResult:(NSString *) result 
                 code:(NSInteger) code;

/**
 *  @brief  设置进度条的可见性
 *
 *  @param visibility 显示/隐藏
 */
- (void)onSetProgressBarVisibility:(int) visibility;

@end

//登陆
@protocol LoginPresenter <HeroinAccountPresenter>

/**
 *  @brief  账户登陆
 *
 *  @param name 名字
 *  @param passwd 密码
 * 
 *  @return YES/NO
 */
- (BOOL)doLoginWithName:(NSString *) name 
                 Passwd:(NSString *) passwd;

/**
 *  @brief  验证码登陆
 *
 *  @param name 名字
 *  @param verification 密码
 * 
 *  @return YES/NO
 */
- (BOOL)doLoginWithName:(NSString *) name 
           Verification:(NSString *) verification;


/**
 *  @brief  设置进度条的可见性
 *
 *  @param visiblity 显示/隐藏
 */
- (void)setProgressBarVisiblity:(int) visiblity;

@end


//验证码
@protocol VerificationPresenter <HeroinAccountPresenter>

/**
 *  @brief  获取验证码
 *
 *  @param telephone 电话号码
 *  @param smsType  验证码类型 1：注册；2：登录；3：重置密码
 * 
 *  @return YES/NO
 */
- (BOOL)getVerificationWithtelephone:(NSString *) telephone 
                             smsType:(NSString *) smsType;

@end

@protocol RefreshTokenPresenter <HeroinAccountPresenter>

/**
 *  @brief  更新token
 *
 *  @param userId 用户ID
 *  @param token  现有token
 * 
 *  @return YES/NO
 */
- (BOOL)RefreshTokenWithuserId:(NSString *)userId 
                         token:(NSString *)token; 

@end


@protocol RegisterPresenter <HeroinAccountPresenter>

/**
 *  @brief  注册
 *
 *  @param userName 用户ID
 *  @param code 验证码
 *  @param password  密码
 *
 *  @return YES/NO
 */
- (BOOL)RegisterWithuserName:(NSString *)userName
                        code:(NSString *)code
                    password:(NSString *)password;


/**
 *  @brief  注册
 *
 *  @param userName 用户ID
 *  @param code 验证码
 *  @param password  密码
 *  @param phone 手机号码
 *  @param email 邮箱
 *  @param nickName  别名
 *  @param gender  性别
 *
 *  @return YES/NO
 */
- (BOOL)RegisterWithuserName:(NSString *)userName
                        code:(NSString *)code
                    password:(NSString *)password
                       phone:(NSString *)phone
                       email:(NSString *)email
                    nickName:(NSString *)nickName
                      gender:(NSString *)gender;


@end



@protocol ResetLoginPasswordPresenter <HeroinAccountPresenter>

/**
 *  @brief  重置登录密码
 *
 *  @param userName 手机号码
 *  @param code 短信验证码
 *  @param password 密码，手机号码+密码明码用MD5加密
 *
 */
- (BOOL)ResetLoginPasswordWithuserName:(NSString *)userName
                                code:(NSString *)code
                            password:(NSString *)password;


@end
