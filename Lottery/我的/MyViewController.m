//
//  MyViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/7.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "MyViewController.h"
#import "WalletViewController.h"
#import "WithdrawalsViewController.h"
#import "MessageViewController.h"
#import "PreferentialViewController.h"
#import "SetUpViewController.h"
#import "ReportStatisticsViewController.h"
#import "QuotaConversionViewController.h"
#import "SubordinateViewController.h"
#import "MembershipListViewController.h"
#import "TeamViewController.h"
#import "MyContractViewController.h"
#import "NoteRecordViewController.h"
#import "CapitalFlowViewController.h"
@interface MyViewController ()<UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *HeadImage;
@property (weak, nonatomic) IBOutlet UILabel *YeLabel;
@property (weak, nonatomic) IBOutlet UILabel *SyLabel;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.title = @"我的";
    self.navigationController.delegate = self;
}
//设置
- (IBAction)addSetUp:(UIButton *)sender {
    SetUpViewController *Bankview = [SetUpViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}

//钱包
- (IBAction)addQB:(UIButton *)sender {
    
    WalletViewController *Bankview = [WalletViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//提现
- (IBAction)addTX:(UIButton *)sender {
    
    WithdrawalsViewController *Bankview = [WithdrawalsViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//投注记录
- (IBAction)addTZ:(UIButton *)sender {

    NoteRecordViewController *Bankview = [NoteRecordViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//资金流水
- (IBAction)addLS:(UIButton *)sender {

    CapitalFlowViewController *Bankview = [CapitalFlowViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}

//消息中心
- (IBAction)addXiaoxi:(UIButton *)sender {
    
    MessageViewController *Bankview = [MessageViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}

//额度转换
- (IBAction)addEdZh:(UIButton *)sender {

    
    
    QuotaConversionViewController *Bankview = [QuotaConversionViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}

//报表统计
- (IBAction)addBbTj:(UIButton *)sender {

    
    ReportStatisticsViewController *Bankview = [ReportStatisticsViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}


//优惠活动
- (IBAction)addYhHd:(UIButton *)sender {
    

    PreferentialViewController *Bankview = [PreferentialViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}


//会员列表
- (IBAction)addHyLb:(UIButton *)sender {
 
    MembershipListViewController *Bankview = [MembershipListViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}


//团队统计
- (IBAction)addTdTj:(UIButton *)sender {
  
    
    TeamViewController *Bankview = [TeamViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}


//发展下级
- (IBAction)addFzXj:(UIButton *)sender {

   
    SubordinateViewController *Bankview = [SubordinateViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}


//我的契约
- (IBAction)addWdQy:(UIButton *)sender {
    
    
    MyContractViewController *Bankview = [MyContractViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}





//隐藏导航栏
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    BOOL isVC = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isVC animated:YES];
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
