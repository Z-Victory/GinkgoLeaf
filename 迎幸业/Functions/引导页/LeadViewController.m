//
//  LeadViewController.m
//  LG_Shop
//
//  Created by Meciery on 2017/6/7.
//  Copyright © 2017年 Meciery. All rights reserved.
//

#import "LeadViewController.h"
#import "MainViewController.h"

@interface LeadViewController ()

@end

@implementation LeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

-(void)configUI
{
    UIScrollView * mainScrollView = [[UIScrollView alloc] init];
    mainScrollView.frame = self.view.bounds;
    mainScrollView.backgroundColor = [UIColor whiteColor];
    mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, 0);
    mainScrollView.showsVerticalScrollIndicator = NO;
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.pagingEnabled = YES;
    mainScrollView.bounces = NO;
    [self.view addSubview:mainScrollView];
    
    UIImageView *leadImage1 = [[UIImageView alloc] init];
    leadImage1.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [mainScrollView addSubview:leadImage1];
    UIImageView *leadImage2 = [[UIImageView alloc] init];
    leadImage2.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [mainScrollView addSubview:leadImage2];
    UIImageView *leadImage3 = [[UIImageView alloc] init];
    leadImage3.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [mainScrollView addSubview:leadImage3];
    
    if (SCREEN_WIDTH == 375)
    {
        if (SCREEN_HEIGHT == 812)
        {
            leadImage1.image = [UIImage imageNamed:@"375*812(1)"];
            leadImage2.image = [UIImage imageNamed:@"375*812(2)"];
            leadImage3.image = [UIImage imageNamed:@"375*812(3)"];
        }
        else
        {
            leadImage1.image = [UIImage imageNamed:@"引导页1"];
            leadImage2.image = [UIImage imageNamed:@"引导页2"];
            leadImage3.image = [UIImage imageNamed:@"引导页3"];
        }
    }
    else if (SCREEN_WIDTH == 320)
    {
        leadImage1.image = [UIImage imageNamed:@"640(01)"];
        leadImage2.image = [UIImage imageNamed:@"640(02)"];
        leadImage3.image = [UIImage imageNamed:@"640(03)"];
    }
    else
    {
        leadImage1.image = [UIImage imageNamed:@"1242(01)"];
        leadImage2.image = [UIImage imageNamed:@"1242(02)"];
        leadImage3.image = [UIImage imageNamed:@"1242(03)"];
    }
    
    UIButton * goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goBtn.frame = CGRectMake(SCREEN_WIDTH/2 - 113.0/2, SCREEN_HEIGHT - 31 - 31, 113, 32);
    [goBtn setImage:[UIImage imageNamed:@"立即体验"] forState:UIControlStateNormal];
    [goBtn addTarget:self action:@selector(goBtnClick) forControlEvents:UIControlEventTouchUpInside];
    leadImage3.userInteractionEnabled = YES;
    [leadImage3 addSubview:goBtn];
}

-(void)goBtnClick
{
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"firstOpen"];
    MainViewController * vc = [[MainViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
