//
//  XMTabBarController.m
//  Lottery
//
//  Created by macbook on 2018/1/9.
//  Copyright © 2018年 小明. All rights reserved.
//

#import "XMTabBarController.h"
#import "XMNavigationController.h"
#import "HomeViewController.h"
#import "RechargeViewController.h"
#import "LotteryDrawViewController.h"
#import "MyViewController.h"
@interface XMTabBarController ()

@end

@implementation XMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"首页" selectedImage:@"2" isHiddenNavgationBar:NO];
    [self setupChildVc:[[RechargeViewController alloc] init] title:@"充值" image:@"1" selectedImage:@"会员充值" isHiddenNavgationBar:NO];
    [self setupChildVc:[[LotteryDrawViewController alloc] init] title:@"开奖" image:@"奖章" selectedImage:@"3" isHiddenNavgationBar:NO];
    [self setupChildVc:[[MyViewController alloc] init] title:@"我的" image:@"我的" selectedImage:@"4" isHiddenNavgationBar:NO];
    
    //[[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    //[[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}




- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"点击的item:%ld title:%@", item.tag, item.title);
}

- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage isHiddenNavgationBar:(BOOL)isHidden
{
    static NSInteger index = 0;
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.tag = index;
    index++;
    XMNavigationController *nav = [[XMNavigationController alloc] initWithRootViewController:vc];
    if (isHidden) {
        nav.navigationBar.hidden = YES;
    }
    
    [self addChildViewController:nav];
}

// 支持设备自动旋转
- (BOOL)shouldAutorotate
{
    return NO;
}

+ (void)initialize
{
    //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:244.0/255.0 green:36.0/255.0 blue:100.0/255.0 alpha:1];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
