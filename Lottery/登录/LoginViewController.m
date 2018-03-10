//
//  LoginViewController.m
//  Lottery
//
//  Created by macbook on 2018/2/24.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "LoginViewController.h"
#import "CSViewController.h"
#import "HomeViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *UserPass;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)AddLogin:(UIButton *)sender {
    
//
//    HomeViewController *Bankview = [HomeViewController new];
//
//    [self.navigationController pushViewController:Bankview animated:YES];
    
}
- (IBAction)cesuBtn:(UIButton *)sender {
    CSViewController *Bankview = [CSViewController new];

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
