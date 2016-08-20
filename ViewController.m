//
//  ViewController.m
//  weibo
//
//  Created by Zhuge_Su on 16/6/1.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

#import "ViewController.h"
#import "MnStatus.h"
#import "MnStatusFrame.h"
#import "MnStatusCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
}



- (NSArray *)dataArr{
    if (_dataArr == nil) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            MnStatus *status = [MnStatus statusWithDict:dic];
            
            MnStatusFrame *statusFrame  = [[MnStatusFrame alloc]init];
            statusFrame.status = status;
            
            [tempArr addObject:statusFrame];
            
        }
        _dataArr = tempArr;
    }
    
    return _dataArr;
}



- (void)createTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, WIDTH, HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor blueColor];
    [self.view addSubview:self.tableView];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MnStatusCell *cell = [MnStatusCell cellWithTableView:tableView];
    
    cell.statusFrame = self.dataArr[indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MnStatusFrame *statusFrame = self.dataArr[indexPath.row];
    return statusFrame.cellHeight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
