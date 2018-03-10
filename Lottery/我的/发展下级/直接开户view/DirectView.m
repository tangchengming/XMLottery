//
//  DirectView.m
//  Lottery
//
//  Created by macbook on 2018/3/9.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "DirectView.h"

@implementation DirectView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"DirectView" owner:self options:nil].lastObject;
        
        self.frame = frame;// 必须给View的frame赋值
        
    }
    
    return self;
    
}

@end
