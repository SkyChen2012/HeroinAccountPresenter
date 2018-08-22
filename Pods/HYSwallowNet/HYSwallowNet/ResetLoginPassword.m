//
//  ResetLoginPassword.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "ResetLoginPassword.h"

@implementation ResetLoginPassword{
    __weak NSString *_userName;
    __weak NSString *_code;
    __weak NSString *_password;
}

- (id)initWithuserName:(NSString *)userName 
                  code:(NSString *)code
              password:(NSString *)password{
    self = [super init];
    if (self) {
        _userName = userName;
        _code = code;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/modifyPwd"];
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
    
    return ^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[wuserName dataUsingEncoding:NSUTF8StringEncoding] name:@"userName"];
        [formData appendPartWithFormData:[wcode dataUsingEncoding:NSUTF8StringEncoding]  name:@"code"];
        [formData appendPartWithFormData:[wpassword dataUsingEncoding:NSUTF8StringEncoding] name:@"passeord"];
    };
}

@end

