//
//  RefreshToken.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "RefreshToken.h"

@implementation RefreshToken{
    __weak NSString *_userId;
    __weak NSString *_token;
}

- (id)initWithuserId:(NSString *)userId 
               token:(NSString *)token{
    self = [super init];
    if (self) {
        _userId = userId;
        _token = token;
        
    }
    NSLog(@"_userId %@ _token %@",_userId,_token);
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/refreshToken"];
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
    
    __typeof__(_userId) __weak wuserId = _userId;
    __typeof__(_token) __weak wtoken = _token;
    
    return ^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[wuserId dataUsingEncoding:NSUTF8StringEncoding] name:@"userId"];
        [formData appendPartWithFormData:[wtoken dataUsingEncoding:NSUTF8StringEncoding]  name:@"token"];
    };
}

@end
