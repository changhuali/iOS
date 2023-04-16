//
//  UserViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/16.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}

@end
