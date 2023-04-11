//
//  LoginViewController.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/7.
//

#import "LoginViewController.h"
#import "NSString+Validate.h"
#import "CQToast.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *formView;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (nonatomic) dispatch_source_t timer;
@property (weak, nonatomic) IBOutlet UITextField *codeInput;
@property (weak, nonatomic) IBOutlet UITextField *phoneInput;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation LoginViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    
    // setup bg of header
    UIImage *headerBg = [UIImage imageNamed:@"BgLogin"];
    self.headerView.backgroundColor = [UIColor colorWithPatternImage:headerBg];
    
    // setup formView
    CALayer *formLayer = self.formView.layer;
    formLayer.cornerRadius = 24;
    formLayer.masksToBounds = YES;
    formLayer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    
    // setup input
    _codeInput.delegate = self;
    
    // setup code button
    [_codeBtn addTarget:self action:@selector(onCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _codeBtn.layer.cornerRadius = 4;
    _codeBtn.layer.masksToBounds = YES;
    [_codeBtn addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
    
    // setup submit button
    [_submitBtn addTarget:self action:@selector(onSubmitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _submitBtn.layer.cornerRadius = 4;
    _submitBtn.layer.masksToBounds = YES;
    [_submitBtn addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
}

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

-(void)onCodeBtnClick {
    [_codeBtn setTitle:@"请稍后..." forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    weakSelf.codeBtn.alpha = 0.6;
    [self countDownFrom:6 to:0 onChange:^(int current) {
        [weakSelf.codeBtn setTitle:[NSString stringWithFormat:@"%ds", current] forState:UIControlStateNormal];
    } done:^{
        [weakSelf.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        weakSelf.codeBtn.alpha = 1;
        weakSelf.codeBtn.userInteractionEnabled = YES;
    }];
    _codeBtn.userInteractionEnabled = NO;
}

-(void)countDownFrom:(int)from to:(int)to onChange: (void (^)(int))onChange done: (void (^)(void))done {
    int interval = 1;
    __block int count = from + interval;
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, 0), interval * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        count -= interval;
        if (count > to) {
            onChange(count);
        } else {
            dispatch_source_cancel(self.timer);
            self.timer = nil;
            done();
        }
    });
    dispatch_resume(self.timer);
}

-(void)onSubmitBtnClick {
    NSString *phone = _phoneInput.text;
    NSString *code = _codeInput.text;
    if (phone.length == 0) {
        [CQToast showWithMessage:@"请输入手机号"];
        return;
    }
    if (![phone cus_isPhone]) {
        [CQToast showWithMessage:@"手机号格式异常"];
        return;
    }
    if (code.length == 0) {
        [CQToast showWithMessage:@"请输入验证码"];
        return;
    }
    if (![code cus_isCode]) {
        [CQToast showWithMessage:@"验证码格式异常"];
        return;
    }

    UIViewController *homeVC = [HomeViewController new];
    homeVC.modalPresentationStyle = UIModalPresentationFullScreen;
    homeVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:homeVC animated:YES completion:nil];
}

-(void)dealloc {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

@end
