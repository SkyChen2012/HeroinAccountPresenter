//
//  ViewController.m
//  HeroinAccountPresenter
//
//  Created by Benson on 2018/8/17.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "ViewController.h"

#import "HeroinAccountPresenter.h"
#import "LogInPresenterCompl.h"
#import "VerificationPresenterCompl.h"
#import "RefreshTokenPresenterCompol.h"

#import "NSString+DictionaryValue.h"

@interface ViewController ()<LoginView>

//账号
@property (weak, nonatomic) IBOutlet UITextField *userName;
//验证码
@property (weak, nonatomic) IBOutlet UITextField *Verification;
//密码
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UITextField *Token;
@property (weak, nonatomic) IBOutlet UITextField *userid;


@end

@implementation ViewController{
    __strong id<LoginPresenter> _LoginPresenter;
    __strong id<VerificationPresenter> _VerificationPresenter;
    __strong id<RefreshTokenPresenter> _RefreshTokenPresenter;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userName.text = @"18757150242";
    
    _LoginPresenter = [[LogInPresenterCompl alloc] initWithView:self];    
    _VerificationPresenter = [[VerificationPresenterCompl alloc] initWithView:self];
    _RefreshTokenPresenter = [[RefreshTokenPresenterCompol alloc] initWithView:self];
    
}

- (IBAction)ButtonOnClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 1:{//密码登陆
            NSLog(@"密码登陆");
            [_LoginPresenter doLoginWithName:self.userName.text Passwd:self.Password.text];
        }break;
        case 2:{//验证码登陆
            NSLog(@"验证码登陆");
            [_LoginPresenter doLoginWithName:self.userName.text Verification:self.Verification.text];
        }break;
        case 3:{//获取验证码--登陆场景
            NSLog(@"获取验证码--登陆场景");
            [_VerificationPresenter getVerificationWithtelephone:self.userName.text smsType:@"2"];
        }break;
        case 4:{//获取验证码--注册场景
            NSLog(@"获取验证码--注册场景");
            [_VerificationPresenter getVerificationWithtelephone:self.userName.text smsType:@"1"];
        }break;
        case 5:{//获取验证码--重置密码场景
            NSLog(@"获取验证码--重置密码场景");
            [_VerificationPresenter getVerificationWithtelephone:self.userName.text smsType:@"3"];
        }break;
        case 6:{//重置Token
            NSLog(@"重置Token");
            [_RefreshTokenPresenter RefreshTokenWithuserId:self.userid.text token:self.Token.text];
        }break;

        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onClearText { 
    self.userName.text = @"";
    self.Password.text = @"";
}

- (void)onLoginResult:(NSString *)result code:(NSInteger)code{
    
    NSLog(@"result %@",result);
    
    NSDictionary *dir = [result dictionaryValue];
    NSLog(@"%@",dir[@"data"]);
 
    self.userid.text = dir[@"data"][@"userId"];
    self.Token.text = dir[@"data"][@"token"];

}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的
    
}
- (void)onSetProgressBarVisibility:(int)visibility { 
    
}


- (void)clear { 
    
}

@end
