//
//  UILabel+CRCreate.m
//  CuriosityRead
//
//  Created by 彭庚 on 16/8/19.
//  Copyright © 2016年 彭庚. All rights reserved.
//

#import "UILabel+CRCreate.h"

@implementation UILabel (CRCreate)

+(UILabel*) createUILabelWithFrame:(CGRect)frame Title:(NSString*)title Color:(UIColor *)color Font:(CGFloat )size FontName:(NSString*)name{

    UILabel* label = [[UILabel alloc]init];
    [label setFrame:frame];
    label.text = title;
    if (name == nil) {
        label.font = [UIFont fontWithName:PF_Regular_FontName size:size];
    }else{
        label.font = [UIFont fontWithName:name size:size];
    }
    
    if (color == nil) {
        label.textColor = [UIColor blackColor];
    }else{
        label.textColor = color;
    }
    
    
    return label;
}
@end
