//
//  ChoiceView.m
//  Lottery
//
//  Created by macbook on 2018/3/2.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "ChoiceView.h"

@interface ChoiceView ()
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end



@implementation ChoiceView
//- (instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self awakeFromNib];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"ChoiceView" owner:self options:nil].lastObject;
        
        self.frame = frame;// 必须给View的frame赋值
        
    }
    
    return self;
    
}

- (IBAction)walletBtn:(UIButton *)sender {
    

    
    if (self.selectedBlock){
        
        self.selectedBlock();
    }
}

- (IBAction)newsBtn:(UIButton *)sender {
    
    if (self.MessageBlock){
        
        self.MessageBlock();
    }
}

- (IBAction)activityBtn:(UIButton *)sender {
    if (self.PreferentialBlock){
        
        self.PreferentialBlock();
    }
}

- (IBAction)serviceBtn:(UIButton *)sender {
}


//- (void)awakeFromNib{
//
//    return [[NSBundle mainBundle] loadNibNamed:@"ChoiceView" owner:nil options:nil].lastObject;
//
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
