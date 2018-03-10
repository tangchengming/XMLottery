//
//  On-lineViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/5.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "On-lineViewController.h"

@interface On_lineViewController ()
@property (weak, nonatomic) IBOutlet UIView *zfView;
@property (weak, nonatomic) IBOutlet UIView *czView;
@property (weak, nonatomic) IBOutlet UILabel *zfName;
@property (weak, nonatomic) IBOutlet UILabel *sm;
@property (weak, nonatomic) IBOutlet UITextField *czNumTextField;
@property (weak, nonatomic) IBOutlet UIButton *czBtn;
@property (weak, nonatomic) IBOutlet UILabel *TsLabel;

@property (nonatomic , strong) UILabel *zfNameLabel;
@property (nonatomic , strong) UILabel *zfSmLabel;
@property (nonatomic , strong) UITextField *NumTextField;
@property (nonatomic , strong) UILabel *TSlabel;
@property (nonatomic , strong) UIButton *czButton;


@end

@implementation On_lineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"在线充值";
    self.view.backgroundColor  = BGCOLOR;
    
    [self initView];
}

- (void)initView{
    
    UIView *Vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_Width, 60)];
    Vi1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:Vi1];

    self.zfNameLabel = [UILabel createUILabelWithFrame:CGRectMake(10, 0, SCREEN_Width-10, 30) Title:@"多多支付" Color:nil Font:16 FontName:nil];
    
    [Vi1 addSubview:self.zfNameLabel];
    
    
    self.zfSmLabel = [UILabel createUILabelWithFrame:CGRectMake(10, 30, SCREEN_Width - 10 , 30) Title:@"单笔充值限额:最低50元,最高9999999元" Color:[UIColor grayColor] Font:14 FontName:nil];
    [Vi1 addSubview:self.zfSmLabel];
    
    UIView *Vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_Width, 50)];
    Vi2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:Vi2];
    
    self.NumTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, SCREEN_Width - 10, 50)];
    self.NumTextField.placeholder = @"请输入充值金额";
    [Vi2 addSubview:self.NumTextField];
    
    

    self.czButton = [UIButton createButtonWithFrame:CGRectMake(10, 160, SCREEN_Width - 10 - 10 , 40) Title:@"立即充值" Target:self Selector:@selector(Recharge:)];
    [self.czButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.czButton.backgroundColor = RGBCOLOR(245.0, 80, 131);
    self.czButton.layer.cornerRadius = 5.0;//2.0是圆角的弧度，根据需求自己更改
    self.czButton.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.czButton];
    
    self.TSlabel = [UILabel createUILabelWithFrame:CGRectMake(10, 220, SCREEN_Width - 10 - 10, 80) Title:@"温馨提示:通常您的到账时间为1分钟,若出现超过30分钟未到账的情况,请点击右上角图标联系在线客服;" Color:[UIColor grayColor] Font:15 FontName:nil];
    self.TSlabel.numberOfLines = 0;
    [self.view addSubview:self.TSlabel];
    
    
}

#pragma mark - button action
- (void)Recharge:(UIButton *)button{
    
    NSLog(@"充值");
}

- (IBAction)AddCZBtn:(UIButton *)sender {
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
