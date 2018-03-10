//
//  MembershipListTableViewCell.h
//  Lottery
//
//  Created by macbook on 2018/3/8.
//  Copyright © 2018年 小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MembershipListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
