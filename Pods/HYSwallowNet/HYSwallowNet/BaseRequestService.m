//
//  BaseRequestService.m
//  HYSwallow
//
//  Created by Benson on 2018/8/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@implementation BaseRequestService

/**
 *  @brief  公共头部设置
 *
 *  @return headerDictionary 公共头部
 */
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSDictionary *headerDictionary=@{@"platform":@"ios",
                                     @"company":@"HYSwallow",
                                     @"Authorization":@"XXXXXXXXXXXXXX"
                                     };
    return headerDictionary;
}

@end
