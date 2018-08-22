//
//  BaseRequestService.h
//  HYSwallow
//
//  Created by Benson on 2018/8/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "TargetConfigContants.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif


#if __has_include(<HeroinNetworking/HeroinRequest.h>)
#import <HeroinNetworking/HeroinRequest.h>
#else
#import "HeroinRequest.h"
#endif

@interface BaseRequestService : HeroinRequest

@end
