//
//  HomeViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/11.
//

#import "HomeViewController.h"
#import <Masonry.h>

@interface HomeViewController ()

@property(nonatomic) UIScrollView *scrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"HOME";
    
    // setup scrollView
    self.scrollView = [UIScrollView new];
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor blueColor];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.bottom.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight);
    }];
    
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDarkContent;
}

@end
