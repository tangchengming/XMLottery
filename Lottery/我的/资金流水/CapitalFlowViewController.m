//
//  CapitalFlowViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/7.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "CapitalFlowViewController.h"
#import "CapitalFlowTableViewCell.h"
@interface CapitalFlowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CapitalFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"资金流水";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 55;
    
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;//隐藏分割线
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CapitalFlowTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    [self initView];
    
}

- (void)initView{
    
    LLSegmentedControl *segmentedControl = [[LLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 50) titleArray:@[@"个人流水", @"团队流水"]];
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.segmentedControlLineStyle = LLSegmentedControlStyleUnderline;
    segmentedControl.segmentedControlTitleSpacingStyle = LLSegmentedControlTitleSpacingStyleWidthFixed;
    segmentedControl.lineWidthEqualToTextWidth = NO;
    segmentedControl.textColor = [UIColor darkTextColor];
    segmentedControl.selectedTextColor = RGBCOLOR(245.0, 80, 131);
    segmentedControl.font = [UIFont systemFontOfSize:16];
    segmentedControl.selectedFont = [UIFont boldSystemFontOfSize:16];
    segmentedControl.lineColor = RGBCOLOR(245.0, 80, 131);
    segmentedControl.lineHeight = 2.f;
    // segmentedControlTitleSpacingStyle 属性设置为 LLSegmentedControlTitleSpacingStyleWidthFixed
    // 则不需要设置titleSpacing，只需要设置titleWidth即可
    segmentedControl.titleWidth = SCREEN_Width / 2;
    segmentedControl.lineWidth = SCREEN_Width / 2;
    segmentedControl.defaultSelectedIndex = 0;
    [self.view addSubview:segmentedControl];
    
    [segmentedControl segmentedControlSelectedWithBlock:^(LLSegmentedControl *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
    }];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CapitalFlowTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
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
