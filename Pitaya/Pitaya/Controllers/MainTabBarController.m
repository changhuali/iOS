//
//  HomeViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/11.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //MARK: setup tabBar
    self.tabBar.backgroundColor = [UIColor colorWithWhite:1 alpha:0.25];
    UITabBarAppearance *apperance = [UITabBarAppearance new];
    [apperance configureWithTransparentBackground];
//    [apperance configureWithTransparentBackground];
//    apperance.backgroundImage = nil;
    apperance.shadowColor = [UIColor grayColor];
//    apperance.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.tabBar.standardAppearance = apperance;
    if (@available(iOS 15, *)) {
        self.tabBar.scrollEdgeAppearance = apperance;
    }
}

@end
