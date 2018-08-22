//
//  ResetLoginPasswordPresenterCompol.m
//  HeroinAccountPresenter
//
//  Created by Benson on 2018/8/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "ResetLoginPasswordPresenterCompol.h"
#import "HYSwallowNet/ResetLoginPassword.h"

@interface ResetLoginPasswordPresenterCompol()

@property (nonatomic,weak) id View;

@end

@implementation ResetLoginPasswordPresenterCompol

- (instancetype)initWithView:(id)View{
    
    self = [super init];
    if (self) {
        _View = View;
    }
    
    return self;
}
- (void)clear {
    
}



- (BOOL)ResetLoginPasswordWithuserName:(NSString *)userName code:(NSString *)code password:(NSString *)password {
    
    if (!userName ||! code ||!password) {
        return NO;
    }
    
    ResetLoginPassword *reg = [[ResetLoginPassword alloc] initWithuserName:userName code:code password:password];
    
    [reg startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
        NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
        
    } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
        
    }];
    
    return YES;
}

@end
