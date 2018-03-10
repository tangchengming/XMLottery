//
//  XMHotView.m
//  Lottery
//
//  Created by macbook on 2018/3/3.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "XMHotView.h"

@implementation XMHotView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"XMHotView" owner:self options:nil].lastObject;
        
        self.frame = frame;// 必须给View的frame赋值
        
    }
    
    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
