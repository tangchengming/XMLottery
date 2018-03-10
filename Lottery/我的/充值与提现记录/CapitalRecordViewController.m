//
//  CapitalRecordViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/6.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "CapitalRecordViewController.h"
#import "CapitalRecordTableViewCell.h"
@interface CapitalRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CapitalRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = self.titleStr;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 55;
    self.tableView.backgroundColor = BGCOLOR;
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;//隐藏分割线
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CapitalRecordTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    if ([self.titleStr isEqualToString:@"充值记录"]) {
        
        NSLog(@"充值记录");
    }else{
        
        NSLog(@"提款记录");
    }

    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CapitalRecordTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
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
