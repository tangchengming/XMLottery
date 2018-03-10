//
//  UIImageView+CRCreate.m
//  CuriosityRead
//
//  Created by 彭庚 on 16/8/19.
//  Copyright © 2016年 彭庚. All rights reserved.
//

#import "UIImageView+CRCreate.h"

@implementation UIImageView (CRCreate)

+(UIImageView*) createImageViewWithFrame:(CGRect)frame name:(NSString*)name{
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    
    if (name != nil) {
        imageView.image = [UIImage imageNamed:name];
    }
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    return imageView;
}
@end
