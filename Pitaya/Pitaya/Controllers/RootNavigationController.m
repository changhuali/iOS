//
//  RootNavigationController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/14.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.delegate = self;
    
    // setup navigationBar
    self.navigationBar.translucent = NO;
    UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor whiteColor];
    self.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationBar.standardAppearance = appearance;
    
    // Do any additional setup after loading the view.
}

-(UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

-(UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
