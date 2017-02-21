//
//  MainViewController.m
//  SNSR
//
//  Created by 60000853 on 2017. 2. 20..
//  Copyright © 2017년 60000853shinhan. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //네비게이션 바 설정
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-7, 0, 270, 44)];
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(-7, 0, 270, 44)];
    searchBar.placeholder = @"검색";
//    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] init];
    [leftBarButtonItem setImage:[UIImage imageNamed:@"ic_menu"]];
    leftBarButtonItem.tintColor = [UIColor grayColor];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"편집" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClicked)];
    rightBarButtonItem.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    
    //사이드 메뉴 설정
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [leftBarButtonItem setTarget: self.revealViewController];
        [leftBarButtonItem setAction: @selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [view addSubview:searchBar];
    self.navigationItem.titleView = view;
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
-(void) leftBtnClicked{
    NSLog(@"왼버튼 클릭");
}
-(void) rightBtnClicked{
    [self performSegueWithIdentifier:@"editButtonSegue" sender:nil];
}


@end
