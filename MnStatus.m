//
//  MnStatus.m
//  weibo
//
//  Created by Zhuge_Su on 16/6/1.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "MnStatus.h"

@implementation MnStatus
+ (instancetype)statusWithDict:(NSDictionary *)dict;
{
    return [[self alloc]initWithDict:dict];

}
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


@end
