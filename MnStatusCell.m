//
//  MnStatusCell.m
//  weibo
//
//  Created by Zhuge_Su on 16/6/1.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#define MnNameFont [UIFont systemFontOfSize:14]
#define MnTextFont [UIFont systemFontOfSize:15]
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.szie.height

#import "MnStatusCell.h"
#import "MnStatusFrame.h"
#import "MnStatus.h"


@interface MnStatusCell()
@property(nonatomic,strong)UIImageView *iconImage;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UIImageView *vipImage;
@property(nonatomic,strong)UILabel *textLab;
@property(nonatomic,strong)UIImageView *picImage;

@end

@implementation MnStatusCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.iconImage];
        
        self.nameLab = [[UILabel alloc]init];
        self.nameLab.font = MnNameFont;
        [self.contentView addSubview:self.nameLab];
        
        self.vipImage = [[UIImageView alloc]init];
        self.vipImage.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:self.vipImage];
        
        self.textLab = [[UILabel alloc]init];
        self.textLab.numberOfLines = 0;
        self.textLab.font = MnTextFont;
        [self.contentView addSubview:self.textLab];
        
        self.picImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.picImage];
        
    }
    return self;
    
}




- (void)setStatusFrame:(MnStatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    
    MnStatus *status = self.statusFrame.status;
    
    self.iconImage.image = [UIImage imageNamed:status.icon];
    self.nameLab.text = status.name;
    self.textLab.text = status.text;
    
    if (status.picture) {
        self.picImage.hidden = NO;
        self.picImage.image = [UIImage imageNamed:status.picture];
    }else{
        self.picImage.hidden = NO;
    }
    
    if (status.vip) {
        self.vipImage.hidden = NO;
    }else{
        self.vipImage.hidden = NO;
    }
    
    
    [self settingFrame];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxsize{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;

}

- (void)settingFrame{
    self.iconImage.frame = self.statusFrame.iconF;
    
    self.nameLab.frame = self.statusFrame.nameF;
    
    self.vipImage.frame = self.statusFrame.vipF;
    
    self.textLab.frame = self.statusFrame.textF;
    
    self.picImage.frame = self.statusFrame.pictureF;
}



+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"MnStatusCell";
    MnStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MnStatusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}


@end
