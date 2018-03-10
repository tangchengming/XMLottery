//
//  HomeViewController.m
//  Lottery
//
//  Created by macbook on 2018/1/9.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "HomeViewController.h"
#import <Masonry.h>
#import "ChoiceView.h"
#import <JhtMarquee/JhtHorizontalMarquee.h>
#import "WalletViewController.h"
#import "MessageViewController.h"
#import "PreferentialViewController.h"
#import "XMHotView.h"
#import "WinningTableViewCell.h"
#import "ClassBtnView.h"
//static CGFloat const kViewsMargin = 10.0f;
@interface HomeViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate,SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic ,strong)SDCycleScrollView *cycleScrollViewT;//banner视图
@property (nonatomic , strong) JhtHorizontalMarquee *horizontalMarquee;//重要通知 跑马灯
@property (nonatomic , strong) ChoiceView *choiceView;//选择view
@property (nonatomic , strong) UIView *noticeView;
@property (nonatomic , strong) UIView *XZView;
@property (nonatomic , strong) UIView *HotView;
@property (nonatomic , strong) UIView *ClassView;
@property (nonatomic , strong) UIView *WinningView;

@property (nonatomic , strong) UITableView *WinningTableView;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign,nonatomic) int count;
@property (strong,nonatomic) NSArray *dataArray;

@end

@implementation HomeViewController{
    
    UIView *_topView;//头部滚动视图
    UIView *_noticeView;//　通知视图
    UIView *_XZView;//　选择视图
    UIView *_HotView;//　热门推荐视图
    UIView *_ClassView;//彩种类视图
    UIView *_WinningView;//中奖视图
    UIScrollView *_bgView;
    UIView *_mainView;//
    // 是否暂停了上下滚动的跑马灯
    BOOL _isPauseV;
    
}




- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 开启跑马灯
    [_horizontalMarquee marqueeOfSettingWithState:MarqueeStart_H];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 关闭跑马灯
    [_horizontalMarquee marqueeOfSettingWithState:MarqueeShutDown_H];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    
    [self addScrollView];
    
    
}

- (void)addScrollView{
    
    _bgView = [[UIScrollView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_Width, SCREEN_Height)];
 
//    _bgView.backgroundColor = BGCOLOR;
    [self.view addSubview:_bgView];
    
    _mainView = [[UIView alloc]init];
    _mainView.backgroundColor = BGCOLOR;
    [_bgView addSubview:_mainView];
    
    _topView = [[UIView alloc] init];
    [_bgView addSubview:_topView];
    
    
    

    
    [self configureViewsFrame];
    [self configureMainView];
}
- (void)configureViewsFrame{
    
    _topView.frame = CGRectMake(0, 0, SCREEN_Width, 150);
    _mainView.frame = CGRectMake(0, CGRectGetMaxY(_topView.frame), SCREEN_Width, 800);
    _bgView.contentSize = CGSizeMake(0, CGRectGetMaxY(_mainView.frame));
    
    [self bannerView];

}

- (void)configureMainView{
    
    _noticeView = [[UIView alloc] init];
    _noticeView.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:_noticeView];
    
    
    _XZView = [[UIView alloc] init];
    _XZView.backgroundColor = [UIColor redColor];
    [_mainView addSubview:_XZView];

    _HotView = [[UIView alloc] init];
    _HotView.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:_HotView];

    _ClassView = [[UIView alloc] init];
    _ClassView.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:_ClassView];

    _WinningView = [[UIView alloc] init];
    _WinningView.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:_WinningView];
    

    
    [_noticeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_mainView.mas_top).with.offset(10);
        make.left.equalTo(_mainView.mas_left).with.offset(0);
        make.right.equalTo(_mainView.mas_right).with.offset(0);
        make.height.mas_equalTo(30);
    }];
    
    
    [_XZView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_noticeView.mas_bottom).with.offset(10);
        make.left.equalTo(_mainView.mas_left).with.offset(0);
        make.right.equalTo(_mainView.mas_right).with.offset(0);
        make.height.mas_equalTo(100);
    }];
    
    [_HotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_XZView.mas_bottom).with.offset(10);
        make.left.equalTo(_mainView.mas_left).with.offset(0);
        make.right.equalTo(_mainView.mas_right).with.offset(0);
        make.height.mas_equalTo(150);
    }];
    
    
    [_ClassView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_HotView.mas_bottom).with.offset(10);
        make.left.equalTo(_mainView.mas_left).with.offset(0);
        make.right.equalTo(_mainView.mas_right).with.offset(0);
        make.height.mas_equalTo(200);
    }];
    
    [_WinningView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_ClassView.mas_bottom).with.offset(10);
        make.left.equalTo(_mainView.mas_left).with.offset(0);
        make.right.equalTo(_mainView.mas_right).with.offset(0);
        make.bottom.equalTo(_mainView.mas_bottom).with.offset(-10);

    }];
    
    //通知
    [self notView];
    [self hotView];
    [self initClassView];
    [self WinninView];
    [self InitChoiceView];
}

//banner广告位
- (void)bannerView{
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_Width, 150) delegate:self placeholderImage:[UIImage imageNamed:@"img_1.01banner"]];
    //    cycleScrollView.backgroundColor = [UIColor redColor];
    cycleScrollView.localizationImageNamesGroup = @[@"ban", @"ban", @"ban"];
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    cycleScrollView.autoScrollTimeInterval = 5.0;
    [_topView addSubview:cycleScrollView];
    self.cycleScrollViewT = cycleScrollView;
    
    
    
}

//重要通知view 跑马灯
- (void)notView{
    
    UIImageView *notImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"18"]];
    notImageView.frame = CGRectMake(10,5, 20, 20);
    [_noticeView addSubview:notImageView];
    
    self.horizontalMarquee = [[JhtHorizontalMarquee alloc] initWithFrame:CGRectMake(35, 0, SCREEN_Width - 50, 30) withSingleScrollDuration:10.0];
    self.horizontalMarquee.text = @"澳门皇家赌场上线啦,真人美女荷官在线发牌!                    ";
    [_noticeView addSubview:_horizontalMarquee];
    
    // 给跑马灯添加点击手势
    UITapGestureRecognizer *htap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(horizontalMarqueeTapGes:)];
    [_horizontalMarquee addGestureRecognizer:htap];
    
}

- (void)horizontalMarqueeTapGes:(UITapGestureRecognizer *)ges {
    NSLog(@"点击__水平__滚动的跑马灯啦！！！");
    _isPauseV = YES;
    
}

//选择视图
- (void)InitChoiceView{

    ChoiceView *chView = [[ChoiceView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];

    [_XZView addSubview:chView];
    //
    [chView setSelectedBlock:^{
        WalletViewController *WalletView = [WalletViewController new];
        [self.navigationController pushViewController:WalletView animated:YES];
        
    }];

    [chView setMessageBlock:^{
        MessageViewController *messView = [MessageViewController new];
        [self.navigationController pushViewController:messView animated:YES];
    }];
    
    [chView setPreferentialBlock:^{
        
        PreferentialViewController *prefView = [PreferentialViewController new];
        [self.navigationController pushViewController:prefView animated:YES];
    }];
    
    
}

- (void)hotView{
    
    UILabel *HotLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 80, 20)];
    HotLabel.text  = @"热门推荐";
    [_HotView addSubview:HotLabel];
    
    UIView *vi3 = [[UIView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_Width, 0.5)];
    vi3.backgroundColor = [UIColor grayColor];
    [_HotView addSubview:vi3];
    
    XMHotView *XMHot= [[XMHotView alloc]initWithFrame:CGRectMake(0, 41, SCREEN_Width, 109)];

    [_HotView addSubview:XMHot];
    
    
}


- (void) initClassView{
    
    UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 40)];
    [_ClassView addSubview:vi1];
    
    UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_Width, 0.5)];
    vi2.backgroundColor = [UIColor grayColor];
    [_ClassView addSubview:vi2];
    
    ClassBtnView *ClassBtn= [[ClassBtnView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 40)];

    [vi1 addSubview:ClassBtn];
    
    
}

- (void)WinninView{
    
    UILabel *HotLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 80, 20)];
    HotLabel.text  = @"最新中奖";
    [_WinningView addSubview:HotLabel];
    
    UIView *vi3 = [[UIView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_Width, 0.5)];
    vi3.backgroundColor = [UIColor grayColor];
    [_WinningView addSubview:vi3];
    self.WinningTableView = [[UITableView alloc]init];
    self.WinningTableView.backgroundColor = [UIColor redColor];
    
    [_WinningView addSubview:self.WinningTableView];
    self.count = 0;
    self.WinningTableView.delegate = self;
    self.WinningTableView.dataSource = self;
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    //测试数据----->将需要展示的数据进行拼接,比如需要展示的数据数组为 @[@"1",@"2",@"3",@"4",@"5"] 那么需要拼接新数组 为 @[@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5"],示例如下
    self.dataArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5", nil];
//
    [self.WinningTableView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    self.WinningTableView.userInteractionEnabled = NO;
    //注册cell
    [self.WinningTableView registerNib:[UINib nibWithNibName:@"WinningTableViewCell" bundle:nil] forCellReuseIdentifier:@"WinningCell"];
    
    [self.WinningTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vi3.mas_bottom).with.offset(5);
        make.left.equalTo(_WinningView.mas_left).with.offset(0);
        make.right.equalTo(_WinningView.mas_right).with.offset(0);
        make.bottom.equalTo(_WinningView.mas_bottom).with.offset(0);
        
    }];
    
    
}

//CADisplayLink 定时器 系统默认每秒调用60次
- (void) tick:(CADisplayLink *)displayLink {
    
    self.count ++;
    //(25.0 / 30.0) * (float)self.count) ---> (tableview需要滚动的contentOffset / 一共调用的次数) * 第几次调用
    //比如该demo中 contentOffset最大值为 = cell的高度 * cell的个数 ,5秒执行一个循环则调用次数为 300,没1/60秒 count计数器加1,当count=300时,重置count为0,实现循环滚动.
    [self.WinningTableView setContentOffset:CGPointMake(0, ((25.0 / 30.0) * (float)self.count)) animated:NO];
    
    if (self.count >= 300) {
        
        self.count = 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
//    WinningTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//
//    cell = [[WinningTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WinningCell"];
//
//    cell.ZjNameLabel.text = @"CJ***";
//    cell.CzNameLabel.text = @"五星定位胆";
//    cell.ZjNumLabel.text = @"喜中3333.000";
//
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)dealloc {
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
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
