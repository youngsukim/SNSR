//
//  ViewController.m
//  SNSR
//
//  Created by 60000853 on 2017. 2. 20..
//  Copyright © 2017년 60000853shinhan. All rights reserved.
//
#import <KakaoOpenSDK/KakaoOpenSDK.h>
#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden=YES;

    // button position
    int xMargin = 30;
    int marginBottom = 25;
    CGFloat btnWidth = self.view.frame.size.width - xMargin * 2;
    int btnHeight = 42;
    
    UIButton* kakaoLoginButton
    = [[KOLoginButton alloc] initWithFrame:CGRectMake(xMargin, self.view.frame.size.height-btnHeight-marginBottom, btnWidth, btnHeight)];
    kakaoLoginButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:kakaoLoginButton];
    
    [kakaoLoginButton addTarget:self
                         action:@selector(invokeLoginWithTarget)
               forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) invokeLoginWithTarget{
    KOSession *session = [KOSession sharedSession];
    
    if (session.isOpen) {
        [session close];
    }
    
    session.presentingViewController = self.navigationController;
    [session openWithCompletionHandler:^(NSError *error) {
        session.presentingViewController = nil;
        
        if (!session.isOpen) {
            switch (error.code) {
                case KOErrorCancelled:
                    break;
                default:
                    [self alert:@"에러" msg:@"알 수 없는 에러 발생"];
                    break;
            }
        }
    }];
}


-(void) alert:(NSString *)str msg:(NSString *)strMsg{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:str message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"확인", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   //                                       NSLog(@"OK action");
                               }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
