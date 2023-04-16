//
//  LoginViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/7.
//

#import "LoginViewController.h"
#import "NSString+Validate.h"
#import "CQToast.h"
#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "UserViewController.h"
#import "RootNavigationController.h"
#import <Masonry.h>


@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *formView;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *codeInput;
@property (weak, nonatomic) IBOutlet UITextField *phoneInput;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (nonatomic) dispatch_source_t timer;
@property (nonatomic) int codeRemainTime;
@property (nonatomic) NSTimeInterval didEnterBackgroundTimestamp;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
//    self.title = @"LOGIN";
    
    //MARK: setup bg of header
    UIImage *headerBg = [UIImage imageNamed:@"BgLogin"];
    self.headerView.backgroundColor = [UIColor colorWithPatternImage:headerBg];
    
    //MARK: setup formView
    CALayer *formLayer = self.formView.layer;
    formLayer.cornerRadius = 24;
    formLayer.masksToBounds = YES;
    formLayer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    
    //MARK: setup input
    _phoneInput.delegate = self;
    _phoneInput.keyboardType = UIKeyboardTypeNamePhonePad;
    _codeInput.delegate = self;
    _codeInput.keyboardType = UIKeyboardTypeNumberPad;
    
    //MARK: setup code button
    [_codeBtn addTarget:self action:@selector(handleCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _codeBtn.layer.cornerRadius = 4;
    _codeBtn.layer.masksToBounds = YES;
    [_codeBtn addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
    
    //MARK: setup submit button
    [_submitBtn addTarget:self action:@selector(handleSubmitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _submitBtn.layer.cornerRadius = 4;
    _submitBtn.layer.masksToBounds = YES;
    [_submitBtn addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
}

//MARK: VC setup
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations  {
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)prefersStatusBarHidden {
    return NO;
}

//MARK: TextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

//MARK: Event handlers
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

-(void)handleCodeBtnClick {
    [_codeBtn setTitle:@"请稍后..." forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.codeBtn setAlpha:0.6];
    });
    int maximumTime = 60;
    [weakSelf.codeBtn setTitle:[NSString stringWithFormat:@"%ds", maximumTime] forState:UIControlStateNormal];
    [self countDownFrom:maximumTime to:0 onChange:^(int current) {
        [weakSelf.codeBtn setTitle:[NSString stringWithFormat:@"%ds", current] forState:UIControlStateNormal];
    } done:^{
        [weakSelf.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [weakSelf.codeBtn setAlpha:1];
        weakSelf.codeBtn.userInteractionEnabled = YES;
    }];
    _codeBtn.userInteractionEnabled = NO;
}

-(void)handleSubmitBtnClick {
//    NSString *phone = _phoneInput.text;
//    NSString *code = _codeInput.text;
//    if (phone.length == 0) {
//        [CQToast showWithMessage:@"请输入手机号"];
//        return;
//    }
//    if (![phone cus_isPhone]) {
//        [CQToast showWithMessage:@"手机号格式异常"];
//        return;
//    }
//    if (code.length == 0) {
//        [CQToast showWithMessage:@"请输入验证码"];
//        return;
//    }
//    if (![code cus_isCode]) {
//        [CQToast showWithMessage:@"验证码格式异常"];
//        return;
//    }

    MainTabBarController *tabBarVC = [MainTabBarController new];
    
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

    tabBarVC.selectedIndex = 0;
    [self.navigationController setViewControllers:[NSArray arrayWithObject:tabBarVC] animated:YES];
}

//MARK: observers
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqual:@"highlighted"]) {
        UIButton *btn = (UIButton *)object;
        if (btn.highlighted) {
            [btn setAlpha:0.8];
        } else {
            [btn setAlpha:1];
        }
    }
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
    if (self.timer) {
        _didEnterBackgroundTimestamp = [NSDate date].timeIntervalSince1970;
    }
}

-(void)applicationWillEnterForeground:(NSNotification *)notification {
    if (self.timer) {
        NSTimeInterval current = [NSDate date].timeIntervalSince1970;
        NSTimeInterval interval = MAX(current - _didEnterBackgroundTimestamp, 0);
        if (interval > 0) {
            self.codeRemainTime -= interval;
        }
    }
}

//MARK: utils
-(void)countDownFrom:(int)from to:(int)to onChange: (void (^)(int))onChange done: (void (^)(void))done {
    self.codeRemainTime = from;
    int interval = 1;
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * interval), interval * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        self.codeRemainTime -= interval;
        if (self.codeRemainTime > to) {
            onChange(self.codeRemainTime);
        } else {
            dispatch_source_cancel(self.timer);
            self.timer = nil;
            done();
        }
    });
    dispatch_resume(self.timer);
}

-(void)dealloc {
    NSLog(@"%@ %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

@end
