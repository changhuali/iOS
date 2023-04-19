//
//  HomeViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/11.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "UserViewController.h"
#import "RootNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

+ (instancetype)initControllers {
    MainTabBarController *tabBarVC = [[self alloc] init];
    
    HomeViewController *homeVC = [HomeViewController new];
    RootNavigationController *homeNavVC = [[RootNavigationController alloc] initWithRootViewController:homeVC];
    homeNavVC.tabBarItem.title = @"首页";
    homeNavVC.tabBarItem.image = [UIImage imageNamed:@"TabbarHome"];
    [tabBarVC addChildViewController:homeNavVC];
    
    UserViewController *userVC = [UserViewController new];
    RootNavigationController *userNavVC = [[RootNavigationController alloc] initWithRootViewController:userVC];
    userNavVC.tabBarItem.title = @"我的";
    userNavVC.tabBarItem.image = [UIImage imageNamed:@"TabbarUser"];
    [tabBarVC addChildViewController:userNavVC];
    
    return tabBarVC;
}

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
