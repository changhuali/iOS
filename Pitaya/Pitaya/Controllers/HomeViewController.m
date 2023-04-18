//
//  HomeViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/16.
//

#import "HomeViewController.h"
#import <Masonry.h>

@interface HomeViewController ()

@property(nonatomic) UIScrollView *scrollView;

@end

@implementation HomeViewController

#pragma mark - setup
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // <ScrollView>
    _scrollView = [UIScrollView new];
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor orangeColor];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    // <Container>
    UIView *contentView = [UIView new];
    [_scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(_scrollView);
        make.width.mas_greaterThanOrEqualTo(_scrollView);
    }];
    
    // <Item1>
    UIView *header = [UIView new];
    [contentView addSubview:header];
    header.backgroundColor = [UIColor blueColor];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1000);
        make.edges.mas_equalTo(header.superview);
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    NSLog(@"%lf", _scrollView.frame.size.width);
}

-(void)viewDidDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UIScrollViewDelegate

@end
