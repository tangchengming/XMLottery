//
//  WalletViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/3.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "WalletViewController.h"
#import "BankCardViewController.h"
#import "RechargeViewController.h"
#import "WithdrawalsViewController.h"
#import "CapitalRecordViewController.h"
@interface WalletViewController ()
@property (nonatomic , strong) UIView *TopView;
@property (nonatomic , strong) UIView *MiddleView;
@property (nonatomic , strong) UIView *BelowView;

@property (weak, nonatomic) IBOutlet UILabel *accountBalance;

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的钱包";
    self.view.backgroundColor = BGCOLOR;
    
//    [self initUI];
}
// 银行卡管理
- (IBAction)addYHK:(UIButton *)sender {
    
    BankCardViewController *Bankview = [BankCardViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
    
}
//充值
- (IBAction)addCZ:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.tabBarController.selectedIndex = 1;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//提款
- (IBAction)addTK:(UIButton *)sender {
    
    
    WithdrawalsViewController *Bankview = [WithdrawalsViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//充值记录
- (IBAction)addCZJL:(UIButton *)sender {
    
    CapitalRecordViewController *Bankview = [CapitalRecordViewController new];
    Bankview.titleStr = @"充值记录";
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//体现记录
- (IBAction)addTXJL:(UIButton *)sender {
    CapitalRecordViewController *Bankview = [CapitalRecordViewController new];
    Bankview.titleStr = @"提现记录";
    [self.navigationController pushViewController:Bankview animated:YES];
}



- (void)initUI{
    
    self.TopView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_Width, 100)];
    self.TopView.backgroundColor = RGBCOLOR(245.0, 80, 131);
    [self.view addSubview:self.TopView];
    
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
