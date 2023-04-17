//
//  HomeViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/16.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}

@end
