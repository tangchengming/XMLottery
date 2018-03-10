//
//  LotteryDrawViewController.m
//  Lottery
//
//  Created by macbook on 2018/1/9.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "LotteryDrawViewController.h"
#import "LotteryDrawCollectionViewCell.h"
@interface LotteryDrawViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic , strong) UICollectionView *collectionView;
@end

@implementation LotteryDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self InitsegmentedControl];
    [self loadcollectionView];
    self.view.backgroundColor = BGCOLOR;
}

- (void)InitsegmentedControl {
    LLSegmentedControl *segmentedControl = [[LLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 50) titleArray:@[@"时时彩", @"福彩", @"11选5", @"快乐十分", @"香港六合彩", @"快三", @"PK10", @"幸运28"]];
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.segmentedControlLineStyle = LLSegmentedControlStyleUnderline;
    segmentedControl.segmentedControlTitleSpacingStyle = LLSegmentedControlTitleSpacingStyleWidthAutoFit;
    // lineWidthEqualToTextWidth 设置为YES, lineWidth 属性则不需设置
    segmentedControl.lineWidthEqualToTextWidth = YES;
    segmentedControl.textColor = [UIColor darkTextColor];
    segmentedControl.selectedTextColor = RGBCOLOR(245.0, 80, 131);
    segmentedControl.font = [UIFont systemFontOfSize:16];
    segmentedControl.selectedFont = [UIFont boldSystemFontOfSize:16];
    segmentedControl.lineColor = RGBCOLOR(245.0, 80, 131);
    segmentedControl.lineHeight = 4.f;
    // segmentedControlTitleSpacingStyle 设置为 LLSegmentedControlTitleSpacingStyleSpacingFixed
    // 则不需要设置 titleWidth 属性
    segmentedControl.titleSpacing = 30;
    segmentedControl.defaultSelectedIndex = 2;
    [self.view addSubview:segmentedControl];
    
    [segmentedControl segmentedControlSelectedWithBlock:^(LLSegmentedControl *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
    }];
    
    
    
}


//开奖视图
- (void)loadcollectionView{
    
    self.collectionView = ({
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat margin = 10;
        
        CGFloat WH = (SCREEN_Width - margin * 3) ;
        
        //每个cell的宽高大小
        layout.itemSize = CGSizeMake(WH, 150);
        
        //间距
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        
        layout.collectionView.showsVerticalScrollIndicator = NO;
        layout.collectionView.showsHorizontalScrollIndicator = NO;
        layout.collectionView.alwaysBounceVertical = YES;
        
        //上左下右间距
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 55, SCREEN_Width, SCREEN_HEIGHT-55 - 49 - 64) collectionViewLayout:layout];
        collectionView.backgroundColor = BGCOLOR;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.scrollsToTop = NO;
        //[collectionView registerClass:[XMCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
//        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.view.mas_top).with.offset(55);
//            make.left.equalTo(self.view.mas_left).with.offset(0);
//            make.right.equalTo(self.view.mas_right).with.offset(0);
//            make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
//
//        }];
        
        //注册重用
        UINib *nib = [UINib nibWithNibName:@"LotteryDrawCollectionViewCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:@"cell1"];
        
        [self.view addSubview:collectionView];
        
        collectionView;
        
        
        
    });
    
}


#pragma mark - UICollectionViewDataSource
//分类显示个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

//分类显示什么数据
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     LotteryDrawCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
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
