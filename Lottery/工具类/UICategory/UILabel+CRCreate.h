//
//  UILabel+CRCreate.h
//  CuriosityRead
//
//  Created by 彭庚 on 16/8/19.
//  Copyright © 2016年 彭庚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CRCreate)



+(UILabel*) createUILabelWithFrame:(CGRect)frame Title:(NSString*)title Color:(UIColor *)color Font:(CGFloat )size FontName:(NSString*)name;

@end
