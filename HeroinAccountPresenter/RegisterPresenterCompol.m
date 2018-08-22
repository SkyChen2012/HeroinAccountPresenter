//
//  RegisterPresenterCompol.m
//  HeroinAccountPresenter
//
//  Created by Benson on 2018/8/22.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "RegisterPresenterCompol.h"
#import "HYSwallowNet/Register.h"

@interface RegisterPresenterCompol()

@property (nonatomic,weak) id View;

@end

@implementation RegisterPresenterCompol

- (instancetype)initWithView:(id)View{
    
    self = [super init];
    if (self) {
        _View = View;
    }
    
    return self;
}
- (void)clear {
    
}

- (BOOL)RegisterWithuserName:(NSString *)userName code:(NSString *)code password:(NSString *)password {
    if (!userName || !code || !password) {
        return NO;
    }
    
    return [self RegisterWithuserName:userName code:code password:password phone:nil email:nil nickName:nil gender:nil];
}

- (BOOL)RegisterWithuserName:(NSString *)userName code:(NSString *)code password:(NSString *)password phone:(NSString *)phone email:(NSString *)email nickName:(NSString *)nickName gender:(NSString *)gender {
    
    if (!userName || !code || !password) {
        return NO;
    }
    
    Register *reg = [[Register alloc] initWithuserName:userName code:code password:password phone:phone email:email nickName:nickName gender:gender];
    
    [reg startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
        NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
    } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
        
    }];
    return YES;
}

@end
