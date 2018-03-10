//
//  MessageTableViewCell.h
//  Lottery
//
//  Created by macbook on 2018/3/8.
//  Copyright © 2018年 小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *redImage;
@property (weak, nonatomic) IBOutlet UILabel *XtLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;

@end
