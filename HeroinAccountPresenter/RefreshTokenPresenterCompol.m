//
//  RefreshTokenPresenterCompol.m
//  HeroinAccountPresenter
//
//  Created by Benson on 2018/8/21.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "RefreshTokenPresenterCompol.h"
#import "HYSwallowNet/RefreshToken.h"

@interface RefreshTokenPresenterCompol()

@property (nonatomic,weak) id View;
@end

@implementation RefreshTokenPresenterCompol
        
-(instancetype)initWithView:(id)View{
    self = [super init];
    if (self) {
        _View = View;
    }
    return self;
}

- (void)clear { 
    
}

- (BOOL)RefreshTokenWithuserId:(NSString *)userId token:(NSString *)token { 
    if (!userId || !token) {
        return NO;
    }
    
    RefreshToken *reToken = [[RefreshToken alloc] initWithuserId:userId token:token];
    [reToken startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
        NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
    } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
        
    }];
    
    return YES;
}


@end
