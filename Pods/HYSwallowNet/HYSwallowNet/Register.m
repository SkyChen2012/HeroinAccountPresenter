//
//  Register.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "Register.h"

@implementation Register{
    __weak NSString *_userName;
    __weak NSString *_code;
    __weak NSString *_password;
    __weak NSString *_phone;
    __weak NSString *_email;
    __weak NSString *_nickName;
    __weak NSString *_gender;
}

- (id)initWithuserName:(NSString *)userName 
                  code:(NSString *)code
              password:(NSString *)password
                 phone:(NSString *)phone
                 email:(NSString *)email
              nickName:(NSString *)nickName
                gender:(NSString *)gender{
    self = [super init];
    if (self) {
        _userName = userName;
        _code = code;
        _password = password;
        _phone = phone;
        _email = email;
        _nickName = nickName;
        _gender = gender;
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/register"];
}

- (HeroinRequestMethod)requestMethod {
    return HeroinRequestMethodPOST;
}

- (NSDictionary *)responseHeaders{
    return @{
             @"Content-Type":@"multipart/form-data"
             };
}

- (AFConstructingBlock)constructingBodyBlock {
    
    __typeof__(_userName) __weak wuserName = _userName;
    __typeof__(_code) __weak wcode = _code;
    __typeof__(_password) __weak wpassword = _password;
    __typeof__(_phone) __weak wphone = _phone;
    __typeof__(_email) __weak wemail = _email;
    __typeof__(_nickName) __weak wnickName = _nickName;
    __typeof__(_gender) __weak wgender = _gender;
    
    return ^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[wuserName dataUsingEncoding:NSUTF8StringEncoding] name:@"userName"];
        [formData appendPartWithFormData:[wcode dataUsingEncoding:NSUTF8StringEncoding]  name:@"code"];
        [formData appendPartWithFormData:[wpassword dataUsingEncoding:NSUTF8StringEncoding] name:@"passeord"];
        if (wphone) {
            [formData appendPartWithFormData:[wphone dataUsingEncoding:NSUTF8StringEncoding] name:@"phone"];
        }
        
        if (wemail) {
            [formData appendPartWithFormData:[wemail dataUsingEncoding:NSUTF8StringEncoding] name:@"email"];
        }
        
        if (wnickName) {
            [formData appendPartWithFormData:[wnickName dataUsingEncoding:NSUTF8StringEncoding] name:@"nickName"];
        }
        if (wgender) {
            [formData appendPartWithFormData:[wgender dataUsingEncoding:NSUTF8StringEncoding] name:@"gender"];
        }
    };
}

@end
