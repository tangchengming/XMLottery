//
//  SubordinateViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/7.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "SubordinateViewController.h"
#import "LinkView.h"
#import "DirectView.h"
@interface SubordinateViewController ()
@property (nonatomic , strong) LinkView *linkView;
@property (nonatomic , strong) DirectView *directView;
@property (nonatomic , assign) NSInteger * index;
@end

@implementation SubordinateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"发展下级";
    [self initView];
    self.linkView = [[LinkView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_Width, SCREEN_HEIGHT - 70)];
    [self.view addSubview:self.linkView];
    
}


- (void)initView{
    
    LLSegmentedControl *segmentedControl = [[LLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 50) titleArray:@[@"直接开户", @"链接开户"]];
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
        if (selectedIndex == 1) {
            self.directView = [[DirectView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_Width, SCREEN_HEIGHT-50)];
            [self.view addSubview:self.directView];
            self.linkView.hidden = YES;
        }else{
            
            self.linkView = [[LinkView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_Width, SCREEN_HEIGHT - 70)];
            [self.view addSubview:self.linkView];
            self.directView.hidden = YES;
            
        }
        
    }];
    

    
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
