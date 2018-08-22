//
//  SMSRegistration.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "SMSRegistration.h"

@implementation SMSRegistration{
    __weak NSString *_telephone;
    __weak NSString *_smsType;
}

- (id)initWithtelephone:(NSString *)telephone 
                smsType:(NSString *)smsType{
    self = [super init];
    if (self) {
        _telephone = telephone;
        _smsType = smsType;
        
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/sms"];
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
    
    __typeof__(_telephone) __weak wtelephone = _telephone;
    __typeof__(_smsType) __weak wsmsType = _smsType;
    
    return ^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[wtelephone dataUsingEncoding:NSUTF8StringEncoding] name:@"telephone"];
        [formData appendPartWithFormData:[wsmsType dataUsingEncoding:NSUTF8StringEncoding]  name:@"smsType"];
    };
}

@end
