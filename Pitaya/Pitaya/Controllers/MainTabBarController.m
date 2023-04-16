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
    UITabBarAppearance *apperance = [UITabBarAppearance new];
    apperance.backgroundColor = [UIColor colorWithWhite:1 alpha:0.75];
    self.tabBar.standardAppearance = apperance;
    self.tabBar.backgroundColor = [UIColor colorWithWhite:1 alpha:0.75];
    if (@available(iOS 15, *)) {
        self.tabBar.scrollEdgeAppearance = apperance;
    }
}

@end
