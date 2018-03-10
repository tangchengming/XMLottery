//
//  UIButton+CRCreate.m
//  CuriosityRead
//
//  Created by 彭庚 on 16/8/19.
//  Copyright © 2016年 彭庚. All rights reserved.
//

#import "UIButton+CRCreate.h"

@implementation UIButton (CRCreate)

+(UIButton*)createButtonWithFrame:(CGRect)frame Target:(id)target Selector:(SEL)selector Image:(NSString*)image ImagePressed:(NSString*)imagePressed
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    UIImage* newImage = [UIImage imageNamed:image];
    [button setImage:newImage forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor whiteColor] forState:0];
    if (imagePressed != nil) {
        UIImage* newPressdImage = [UIImage imageNamed:imagePressed];
        [button setImage:newPressdImage forState:UIControlStateSelected];

    }
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
+(UIButton*) createButtonWithFrame:(CGRect)frame Title:(NSString*)title Target:(id)target Selector:(SEL)selector
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton*) createButtonWithFrame:(CGRect)frame  Title:(NSString*)title Color:(UIColor *)color Font:(CGFloat )size FontName:(NSString*)name{

    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:frame];
    [button setTitle:title forState:0];
    
    if (color == nil) {
        [button setTitleColor:[UIColor whiteColor] forState:0];
    }else{
        [button setTitleColor:color forState:0];
    }
    
    if (name == nil) {
        button.titleLabel.font = [UIFont systemFontOfSize:size];
    }else{
        button.titleLabel.font = [UIFont fontWithName:@"DFHaiBaoW12-GB" size:size];
    }
    
    return button;
    
}
@end
