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
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = YES;
    
    [self.loginButton setBackgroundColor:[UIColor colorWithRed:0x00 / 255.0 green:0x00 / 255.0 blue:0x00 / 255.0 alpha:1.0]];
    self.loginButton.clipsToBounds = YES;
    self.loginButton.layer.cornerRadius = 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
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
