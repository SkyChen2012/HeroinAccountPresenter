//
//  LogInPresenterCompl.m
//  HeroinAccountPresenter
//
//  Created by Benson on 2018/8/17.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "LogInPresenterCompl.h"
#import "HYSwallowNet/LogInApi.h"

@interface LogInPresenterCompl()

@property (nonatomic,weak) id<LoginView> View;

@end

@implementation LogInPresenterCompl


- (instancetype)initWithView:(id)View{
    
    self = [super init];
    if (self) {
        _View = View;
    }
    return self;
}

- (void)clear { 
    [_View onClearText];
}

- (BOOL)doLoginWithName:(NSString *)name Passwd:(NSString *)passwd { 
    if (!name || !passwd) {
        return NO;
    }
    LogInApi *reg = [[LogInApi alloc] initWithauthType:@"1" credence:name code:passwd];
    [reg startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
        [_View onLoginResult:[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] code:request.responseStatusCode];
    } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
        [_View onLoginResult:[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] code:request.responseStatusCode];
    }];
    
    return YES;
}

- (BOOL)doLoginWithName:(NSString *)name Verification:(NSString *)verification{
    if (!name || !verification || verification.length != 6 ) {
        return  NO;
    }
    LogInApi *reg = [[LogInApi alloc] initWithauthType:@"2" credence:name code:verification];
    [reg startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
        [_View onLoginResult:[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] code:request.responseStatusCode];
    } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
        [_View onLoginResult:[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] code:request.responseStatusCode];
    }];
    
    return YES;
}

- (void)setProgressBarVisiblity:(int)visiblity { 
    
}

@end
