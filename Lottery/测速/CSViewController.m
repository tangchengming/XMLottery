//
//  CSViewController.m
//  Lottery
//
//  Created by macbook on 2018/2/27.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "CSViewController.h"
#import "LoginViewController.h"
@interface CSViewController ()

@end

@implementation CSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)addLogin:(UIButton *)sender {
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
