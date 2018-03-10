//
//  SetUpViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/7.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "SetUpViewController.h"
#import "BankCardViewController.h"
#import "CapitalRecordViewController.h"
#import "ModifyLoginPassViewController.h"
#import "AmendCipherViewController.h"
#import "LoginViewController.h"
@interface SetUpViewController ()

@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置中心";
}
//修改登录密码
- (IBAction)Loginpassword:(UIButton *)sender {
    ModifyLoginPassViewController *Bankview = [ModifyLoginPassViewController new];

    [self.navigationController pushViewController:Bankview animated:YES];
}
//修改提款密码
- (IBAction)TKpassword:(UIButton *)sender {
//
    AmendCipherViewController *Bankview = [AmendCipherViewController new];

    [self.navigationController pushViewController:Bankview animated:YES];
}
//银行卡管理
- (IBAction)yhkGL:(UIButton *)sender {
    
    BankCardViewController *Bankview = [BankCardViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//充值记录
- (IBAction)CZJL:(UIButton *)sender {
    CapitalRecordViewController *Bankview = [CapitalRecordViewController new];
    Bankview.titleStr = @"充值记录";
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//提款记录
- (IBAction)TKJL:(UIButton *)sender {
    
    CapitalRecordViewController *Bankview = [CapitalRecordViewController new];
    Bankview.titleStr = @"提款记录";
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//绑定谷歌验证
- (IBAction)BDgoogle:(UIButton *)sender {
    
    BankCardViewController *Bankview = [BankCardViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//手机客户端
- (IBAction)SJApp:(UIButton *)sender {
    
    BankCardViewController *Bankview = [BankCardViewController new];
    
    [self.navigationController pushViewController:Bankview animated:YES];
}
//退出登录
- (IBAction)TClogin:(UIButton *)sender {
    LoginViewController *Bankview = [LoginViewController new];
    [self presentViewController:Bankview animated:NO completion:nil];
    
    
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
