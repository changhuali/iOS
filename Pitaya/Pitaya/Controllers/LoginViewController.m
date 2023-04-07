//
//  LoginViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/7.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // setup bg of header
    UIImage *headerBg = [UIImage imageNamed:@"BgLogin"];
    self.headerView.backgroundColor = [UIColor colorWithPatternImage:headerBg];
    
    // setup formView
    CALayer *formLayer = self.formView.layer;
    formLayer.cornerRadius = 24;
    formLayer.masksToBounds = YES;
    formLayer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    
    
    
}




@end
