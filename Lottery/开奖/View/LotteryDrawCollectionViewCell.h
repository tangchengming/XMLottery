//
//  LotteryDrawCollectionViewCell.h
//  Lottery
//
//  Created by macbook on 2018/3/7.
//  Copyright © 2018年 小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LotteryDrawCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *BGView;
@property (weak, nonatomic) IBOutlet UILabel *LotteryName;
@property (weak, nonatomic) IBOutlet UILabel *KJQSLabel;
@property (weak, nonatomic) IBOutlet UIButton *NumBtn1;
@property (weak, nonatomic) IBOutlet UIButton *NumBtn2;
@property (weak, nonatomic) IBOutlet UIButton *NumBtn3;
@property (weak, nonatomic) IBOutlet UIButton *NumBtn4;
@property (weak, nonatomic) IBOutlet UIButton *NumBtn5;
@property (weak, nonatomic) IBOutlet UILabel *ZHLabel;
@property (weak, nonatomic) IBOutlet UILabel *LhLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhDXLabel1;
@property (weak, nonatomic) IBOutlet UILabel *zhDXLabel2;
@property (weak, nonatomic) IBOutlet UILabel *LhName;

@end
