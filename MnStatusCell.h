//
//  MnStatusCell.h
//  weibo
//
//  Created by Zhuge_Su on 16/6/1.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MnStatusFrame;

@interface MnStatusCell : UITableViewCell

@property(nonatomic,strong)MnStatusFrame *statusFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

//+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
