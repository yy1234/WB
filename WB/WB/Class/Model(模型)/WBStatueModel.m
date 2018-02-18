//
//  WBStatueModel.m
//  WB
//
//  Created by yang'yang on 2018/2/18.
//  Copyright © 2018年 yang'yang. All rights reserved.
//

#import "WBStatueModel.h"

@implementation WBStatueModel

+ (NSDictionary *)modelCustomPropertyMapper {
    NSDictionary *dic=@{@"wb_id" :@"id"
                      };
    return dic;
}

@end
