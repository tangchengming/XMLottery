//
//  ClassBtnView.m
//  Lottery
//
//  Created by macbook on 2018/3/3.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "ClassBtnView.h"

@implementation ClassBtnView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"ClassBtnView" owner:self options:nil].lastObject;
        
        self.frame = frame;// 必须给View的frame赋值
        
    }
    
    return self;
    
}

- (IBAction)addQbBtn:(UIButton *)sender {
    self.QbBtn.selected = YES;
    self.YlBtn.selected = NO;
    self.XyhBtn.selected = NO;
    self.Xy28Btn.selected = NO;
    self.SscBtn.selected = NO;
    self.GdBtn.selected = NO;
    
}

- (IBAction)addYlBtn:(UIButton *)sender {
    self.QbBtn.selected = NO;
    self.YlBtn.selected = YES;
    self.XyhBtn.selected = NO;
    self.Xy28Btn.selected = NO;
    self.SscBtn.selected = NO;
    self.GdBtn.selected = NO;
}

- (IBAction)addXyhBtn:(UIButton *)sender {
    self.QbBtn.selected = NO;
    self.YlBtn.selected = NO;
    self.XyhBtn.selected = YES;
    self.Xy28Btn.selected = NO;
    self.SscBtn.selected = NO;
    self.GdBtn.selected = NO;
}

- (IBAction)Xy28Btn:(UIButton *)sender {
    self.QbBtn.selected = NO;
    self.YlBtn.selected = NO;
    self.XyhBtn.selected = NO;
    self.Xy28Btn.selected = YES;
    self.SscBtn.selected = NO;
    self.GdBtn.selected = NO;
}

- (IBAction)addSscBtn:(UIButton *)sender {
    self.QbBtn.selected = NO;
    self.YlBtn.selected = NO;
    self.XyhBtn.selected = NO;
    self.Xy28Btn.selected = NO;
    self.SscBtn.selected = YES;
    self.GdBtn.selected = NO;
}

- (IBAction)addGdBtn:(UIButton *)sender {
    self.QbBtn.selected = NO;
    self.YlBtn.selected = NO;
    self.XyhBtn.selected = NO;
    self.Xy28Btn.selected = NO;
    self.SscBtn.selected = NO;
    self.GdBtn.selected = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
