//
//  ReportStatisticsViewController.m
//  Lottery
//
//  Created by macbook on 2018/3/7.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "ReportStatisticsViewController.h"
#import "ReportStatisticsCollectionViewCell.h"
@interface ReportStatisticsViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *ReportCollectionView;

@end

@implementation ReportStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"报表统计";
    [self initView];
    [self loadcollectionView];
}

- (void)initView{
    
    LLSegmentedControl *segmentedControl = [[LLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 50) titleArray:@[@"个人报表", @"团队报表"]];
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
    }];
    
}


//开奖视图
- (void)loadcollectionView{
    
    
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat margin = 10;
        
        CGFloat WH = (SCREEN_Width - margin * 3) ;
        
        //每个cell的宽高大小
        layout.itemSize = CGSizeMake(WH, 166);
        
        //间距
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        
        layout.collectionView.showsVerticalScrollIndicator = NO;
        layout.collectionView.showsHorizontalScrollIndicator = NO;
        layout.collectionView.alwaysBounceVertical = YES;
        
        //上左下右间距
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
 
        self.ReportCollectionView.collectionViewLayout = layout;
        self.ReportCollectionView.backgroundColor = BGCOLOR;
        self.ReportCollectionView.delegate = self;
        self.ReportCollectionView.dataSource = self;
        self.ReportCollectionView.scrollsToTop = NO;
        //[collectionView registerClass:[XMCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
 
        
        //注册重用
        UINib *nib = [UINib nibWithNibName:@"ReportStatisticsCollectionViewCell" bundle:nil];
        [self.ReportCollectionView registerNib:nib forCellWithReuseIdentifier:@"cell1"];
        

        
 
    
}


#pragma mark - UICollectionViewDataSource
//分类显示个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

//分类显示什么数据
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ReportStatisticsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    return cell;
    
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"item1======%ld",(long)indexPath.item);
    NSLog(@"row1=======%ld",(long)indexPath.row);
    NSLog(@"section1===%ld",(long)indexPath.section);
    
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
