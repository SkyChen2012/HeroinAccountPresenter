//
//  LogInApi.m
//  HYSwallow
//
//  Created by Benson on 2018/8/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LogInApi.h"

@implementation LogInApi{
    __weak NSString *_authType;
    __weak NSString *_credence;
    __weak NSString *_code;
}

- (id)initWithauthType:(NSString *)authType 
              credence:(NSString *)credence 
                  code:(NSString *)code{
    self = [super init];
    if (self) {
        _authType = authType;
        _credence = credence;
        _code = code;

    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/authentication"];
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
    
    __typeof__(_authType) __weak wauthType = _authType;
    __typeof__(_credence) __weak wcredence = _credence;
    __typeof__(_code) __weak wcode = _code;
    
    return ^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[wauthType dataUsingEncoding:NSUTF8StringEncoding] name:@"authType"];
        [formData appendPartWithFormData:[wcredence dataUsingEncoding:NSUTF8StringEncoding]  name:@"credence"];
        [formData appendPartWithFormData:[wcode dataUsingEncoding:NSUTF8StringEncoding] name:@"code"];
    };
}
@end
