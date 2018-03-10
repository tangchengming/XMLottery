//
//  RechargeViewController.m
//  Lottery
//
//  Created by macbook on 2018/1/9.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "RechargeViewController.h"
#import "On-lineViewController.h"
#import "PTRechargeViewController.h"
@interface RechargeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView * RechargeTableView;
@property (nonatomic, assign) NSInteger REindex;
@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. screening
//    self.RechargeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 51, SCREEN_Width, SCREEN_HEIGHT - 51 - 49) style:UITableViewStylePlain];
    self.REindex = 0;
    [self initView];
    
}

- (void) initView{
    
    LLSegmentedControl *segmentedControl = [[LLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 50) titleArray:@[@"在线充值", @"普通入款"]];
    segmentedControl.backgroundColor = BGCOLOR;
    // segmentedControlLineStyle属性设置为LLSegmentedControlLineStyleHidden
    // 则有关下划线的相关属性不需要设置
    segmentedControl.segmentedControlLineStyle = LLSegmentedControlLineStyleHidden;
    segmentedControl.segmentedControlTitleSpacingStyle = LLSegmentedControlTitleSpacingStyleWidthFixed;
    segmentedControl.textColor = [UIColor darkTextColor];
    segmentedControl.selectedTextColor = RGBCOLOR(245.0, 80, 131);;
    segmentedControl.font = [UIFont systemFontOfSize:16];
    segmentedControl.selectedFont = [UIFont boldSystemFontOfSize:16];
    segmentedControl.titleWidth = SCREEN_Width / 4;
    segmentedControl.defaultSelectedIndex = 0;
    [self.view addSubview:segmentedControl];
    
    [segmentedControl segmentedControlSelectedWithBlock:^(LLSegmentedControl *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
        [self Rindex:selectedIndex];
    }];
    
    self.RechargeTableView = [[UITableView alloc]init];
    self.RechargeTableView.tableFooterView = [UIView new];

    
    self.RechargeTableView.delegate = self;
    self.RechargeTableView.dataSource = self;
    [self.view addSubview:self.RechargeTableView];
    
    
    
    [self.RechargeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(segmentedControl.mas_bottom).with.offset(10);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
        
    }];
    
    
    
}

- (void)Rindex:(NSInteger)index{
    self.REindex = index;
    NSLog(@"id:%ld",self.REindex);
    [self.RechargeTableView reloadData];
    
    
}

//用来指定表视图的分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //分区设置为1
    return 1;
}

//用来指定特定分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //设置为20行
    return 10;
}

//配置特定行中的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        //单元格样式设置为UITableViewCellStyleDefault
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        if (self.REindex == 1) {
            cell.textLabel.text = @"普通充值";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }else{
            cell.textLabel.text = @"在线充值";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
    }
    return cell;
}

// cell选中时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    
    if (indexPath.row == 9 ) {
        PTRechargeViewController *onview = [PTRechargeViewController new];
        
        [self.navigationController pushViewController:onview animated:YES];
        
    }else{
        
        On_lineViewController *onview = [On_lineViewController new];
        
        [self.navigationController pushViewController:onview animated:YES];
    }
}

//设置单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat
{
    //这里设置成150
    return 50;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
