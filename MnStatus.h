//
//  MnStatus.h
//  weibo
//
//  Created by Zhuge_Su on 16/6/1.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MnStatus : NSObject
@property(nonatomic,strong)NSString *text;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *picture;
@property(nonatomic,assign)BOOL vip;


+ (instancetype)statusWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end
