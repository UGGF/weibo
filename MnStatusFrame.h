//
//  MnStatusFrame.h
//  weibo
//
//  Created by Zhuge_Su on 16/6/1.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MnStatus;

@interface MnStatusFrame : NSObject

@property(nonatomic,assign,readonly)CGRect iconF;
@property(nonatomic,assign,readonly)CGRect nameF;
@property(nonatomic,assign,readonly)CGRect vipF;
@property(nonatomic,assign,readonly)CGRect textF;
@property(nonatomic,assign,readonly)CGRect pictureF;

@property(nonatomic,assign)CGFloat cellHeight;

@property(nonatomic,strong)MnStatus *status;

@end
