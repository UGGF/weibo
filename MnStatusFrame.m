//
//  MnStatusFrame.m
//  weibo
//
//  Created by Zhuge_Su on 16/6/1.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//
#define MnNameFont [UIFont systemFontOfSize:14]
#define MnTextFont [UIFont systemFontOfSize:15]



#import "MnStatusFrame.h"
#import "MnStatus.h"

@implementation MnStatusFrame


- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxsize{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    
}


- (void)setStatus:(MnStatus *)status{
    _status = status;
    
    _iconF = CGRectMake(10, 10, 30, 30);
    
    CGSize nameSize = [self sizeWithText:self.status.name font:MnNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    _nameF = CGRectMake(CGRectGetMaxX(_iconF) + 10, 10 + (30-nameSize.height)*0.5, nameSize.width, nameSize.height);
    
    _vipF = CGRectMake(CGRectGetMaxX(_nameF) + 10, 10 + (30-nameSize.height)*0.5, 14, 14);
    
    CGSize textSize = [self sizeWithText:self.status.text font:MnTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    _textF= CGRectMake(10, CGRectGetMaxY(_iconF) + 10, textSize.width, textSize.height);
    
    if (self.status.picture) {
        _pictureF = CGRectMake(10, CGRectGetMaxY(_textF) + 10, 100, 100);

        _cellHeight = CGRectGetMaxY(_pictureF) + 10;
    }else{
        _cellHeight = CGRectGetMaxY(_textF) + 10;
        
    }
}


@end
