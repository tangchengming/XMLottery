//
//  BankCardViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/6.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "BankCardViewController.h"
#import "NewBankCardViewController.h"
@interface BankCardViewController ()
@property (weak, nonatomic) IBOutlet UIView *yhkView;

@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"银行卡列表";
    
}
- (IBAction)TJBtn:(UIButton *)sender {
    NewBankCardViewController *NewBankCardview = [NewBankCardViewController new];
    
    [self.navigationController pushViewController:NewBankCardview animated:YES];
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
