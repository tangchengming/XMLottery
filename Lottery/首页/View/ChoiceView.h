//
//  ChoiceView.h
//  Lottery
//
//  Created by macbook on 2018/3/2.
//  Copyright © 2018年 小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceView : UIView
@property (nonatomic, copy) void (^selectedBlock)(void);//钱包
@property (nonatomic, copy) void (^MessageBlock)(void);//消息
@property (nonatomic, copy) void (^PreferentialBlock)(void);//优惠

@end
