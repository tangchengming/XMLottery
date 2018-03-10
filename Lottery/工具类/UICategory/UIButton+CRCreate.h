//
//  UIButton+CRCreate.h
//  CuriosityRead
//
//  Created by 彭庚 on 16/8/19.
//  Copyright © 2016年 彭庚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CRCreate)

+(UIButton*)createButtonWithFrame:(CGRect)frame Target:(id)target Selector:(SEL)selector Image:(NSString*)image ImagePressed:(NSString*)imagePressed;

+(UIButton*) createButtonWithFrame:(CGRect)frame Title:(NSString*)title Target:(id)target Selector:(SEL)selector;

+(UIButton*) createButtonWithFrame:(CGRect)frame  Title:(NSString*)title Color:(UIColor *)color Font:(CGFloat )size FontName:(NSString*)name;

@end
