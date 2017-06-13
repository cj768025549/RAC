//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by Mr.Wang on 16/4/19.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "loginViewModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property(nonatomic, strong) loginViewModel *loginVM;

@end

@implementation ViewController

- (loginViewModel *)loginVM {
    if (!_loginVM) {
        _loginVM = [[loginViewModel alloc] init];
    }
    return _loginVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // MVVM:
    // VM:视图模型----处理展示的业务逻辑  最好不要包括视图
    // 每一个控制器都对应一个VM模型
    // MVVM:开发中先创建VM，把业务逻辑处理好，然后在控制器里执行
    [self bindViewModel];
    [self loginEvent];
}

- (void)bindViewModel {
    // 1.给视图模型的账号和密码绑定信号
    RAC(self.loginVM, account) = self.accountField.rac_textSignal;
    RAC(self.loginVM, pwd) = self.pwdField.rac_textSignal;
    
}

- (void)loginEvent {
    // 1.处理文本框业务逻辑--- 设置按钮是否能点击
    RAC(self.loginBtn, enabled) = self.loginVM.loginEnableSignal;
    // 2.监听登录按钮点击
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击登录按钮");
        // 处理登录事件
        [[self.loginVM.loginCommand execute:nil]subscribeNext:^(id  _Nullable x) {
            NSLog(@"请求结束，读取数据，刷新UI");
        }];
    }];
    
    // 3.登录命令的信号的执行过程
    [[self.loginVM.loginCommand.executing skip:1] subscribeNext:^(id x) { // 跳过第一步（"没有执行"这步）
        if ([x boolValue] == YES) {
            NSLog(@"--正在执行,显示loading");//第一次在初始化的时候调用
            // 显示蒙版
        }else { //执行完成
            NSLog(@"执行完成");
            // 取消蒙版
        }
    }];
    
    // 4.获取登录命令返回的信号源
    [self.loginVM.loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"请求结束，读取数据，刷新UI");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

