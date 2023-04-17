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
    
    // setup navigationBar
    UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor colorWithWhite:1 alpha:0.25];
    appearance.backgroundEffect = nil;
    self.navigationBar.scrollEdgeAppearance = appearance;
    self.navigationBar.standardAppearance = appearance;
}

-(UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

-(UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
