//
//  VerificationPresenterCompl.m
//  HeroinAccountPresenter
//
//  Created by Benson on 2018/8/17.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "VerificationPresenterCompl.h"
#import "HYSwallowNet/SMSRegistration.h"

@interface VerificationPresenterCompl()

@property (nonatomic,weak) id View;

@end

@implementation VerificationPresenterCompl

- (instancetype)initWithView:(id)View{
   
    self = [super init];
    if (self) {
        _View = View;
    }
    return self;
}



- (void)clear { 
    
}

- (BOOL)getVerificationWithtelephone:(NSString *)telephone smsType:(NSString *)smsType { 
    
    if (!telephone || !smsType) {
        return NO;
    }
    
    SMSRegistration *reg = [[SMSRegistration alloc] initWithtelephone:telephone smsType:smsType];
    [reg startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
        NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);

    } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
        
    }];
    return YES;
}

@end
