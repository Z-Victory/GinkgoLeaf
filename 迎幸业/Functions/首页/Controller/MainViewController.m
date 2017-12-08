//
//  MainViewController.m
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/11.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import "MainViewController.h"
#import <SDCycleScrollView.h>
#import "MainCell.h"
#import "LYHAlertView.h"

#define kCloseCellHeight    179.f
#define kOpenCellHeight     488.f
#define kRowsCount          10

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    UIView * searchView;
    UIView * navView;                         //导航栏自定义view
    UIColor *navColor;                        //导航栏颜色
    
    UIView * leftView;                        //城市背景
    UIImageView * leftImage;                  //城市按钮向下箭头
    UILabel * leftLabel;                      //当前定位的城市
    SDCycleScrollView * imageViewDisplay;     //banner图
    UIView * headView;                        //头部视图
}
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *cellHeights;
@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated
{
//    self.navigationController.navigationBar.hidden = YES;
    UIView * statusBarView = [[UIView alloc]   initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.navigationController.navigationBar addSubview:statusBarView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


- (void)viewDidDisappear:(BOOL)animated
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createCellHeightsArray];
    [self loadHeadView];
    [self loadNavBar];
    [self tableView];
}
#pragma mark - 加载Nav
-(void)loadNavBar
{
    searchView = [[UIView alloc] init];
    searchView.frame = CGRectMake(100, 7, 225, 30);
    searchView.layer.cornerRadius = 15;
    searchView.backgroundColor = [self hexStringToColor:@"#F1F3F7"];
    
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(12, 6, 18, 18);
    imageView.image = [UIImage imageNamed:@"search_logo"];
    [searchView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(44, 0, 226 - 54, 30);
    label.text = @"请输入岗位、商家名称";
    label.textColor = [self hexStringToColor:@"#6d6d6d"];
    label.font = [UIFont systemFontOfSize:15];
    [searchView addSubview:label];
    
    
    UIView *leftItemView = [[UIView alloc] init];
    leftItemView.frame = CGRectMake(0, 0, 80, 44);
    
    leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(8, 7, 75, 30);
    leftView.backgroundColor = [UIColor clearColor];
    //    leftView.layer.masksToBounds = YES;
    //    leftView.layer.cornerRadius = 15;
    //    leftView.layer.borderWidth = 0.5;
    //    leftView.layer.borderColor = [UIColor whiteColor].CGColor;
    [leftItemView addSubview:leftView];
    
    leftLabel = [[UILabel alloc] init];
    leftLabel.frame = CGRectMake(13, 12, 50, 20);
    leftLabel.textColor = [UIColor whiteColor];
    //leftLabel.adjustsFontSizeToFitWidth = YES;
    leftLabel.font = [UIFont systemFontOfSize:14];
    leftLabel.textAlignment = NSTextAlignmentCenter;
    leftLabel.text = @"定位中";
    [leftItemView addSubview:leftLabel];
    
    leftImage = [[UIImageView alloc] init];
    leftImage.frame = CGRectMake(65, 19, 14, 8);
    leftImage.image = [UIImage imageNamed:@"nav_icon_arrow"];
    [leftItemView addSubview:leftImage];
    
    //    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftItemView];
    //    self.navigationItem.leftBarButtonItem = leftBar;
    
    
    navView = [[UIView alloc] init];
    navView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    [navView addSubview:searchView];
    [navView addSubview:leftItemView];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar addSubview:navView];
    
    //    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
    //    self.navigationItem.rightBarButtonItem = rightBar;
    
//    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftTapAction)];
//    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTapAction)];
//    UITapGestureRecognizer *titleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleTapAction)];
    
    
//    [searchView addGestureRecognizer:titleTap];
//    [rightLabel addGestureRecognizer:rightTap];
//    [leftItemView addGestureRecognizer:leftTap];
}
- (void)createCellHeightsArray
{
    for (int i = 0; i < kRowsCount; i ++) {
        [self.cellHeights addObject:@(kCloseCellHeight)];
    }
}
- (UITableView *)tableView
{
    UIImageView * bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    bgImage.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:bgImage];
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView registerNib:[UINib nibWithNibName:@"MainCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
//        _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
        _tableView.backgroundColor = [UIColor clearColor];
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *))
        {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        else
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
#pragma mark - 加载各部分UI
- (void)loadHeadView
{
    headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.45 + 115)];
    headView.backgroundColor = [UIColor clearColor];
    imageViewDisplay = nil;
    //获取要显示的位置
    
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.45);
    
    //初始化控件
    imageViewDisplay = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"firstBanner"]];
    imageViewDisplay.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    imageViewDisplay.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    
    //         --- 模拟加载延迟
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        if(_imageNameArr.count > 0){
    //            imageViewDisplay.imageURLStringsGroup = _imageNameArr;
    //        }else{
    //            imageViewDisplay.imageURLStringsGroup = @[@"WechatIMG122.png"];
    //        }
    //    });
    
    //    _tableView.tableHeaderView = imageViewDisplay;
    
//    imageViewDisplay.imageURLStringsGroup = _imageNameArr;
    [headView addSubview:imageViewDisplay];
    
    secondPlate.frame = CGRectMake(0, DEF_BOTTOM(imageViewDisplay), SCREEN_WIDTH, 70);
    [headView addSubview:secondPlate];
    
    thirdPlate.frame = CGRectMake(20, DEF_BOTTOM(secondPlate)+10, SCREEN_WIDTH-40, 35);
    thirdPlate.layer.masksToBounds = YES;
    thirdPlate.layer.cornerRadius = 5;
    [headView addSubview:thirdPlate];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCREEN_WIDTH * 0.45 + 115;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kRowsCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellHeights[indexPath.row].floatValue;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(MainCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![cell isKindOfClass:[MainCell class]]) return;
    
    cell.backgroundColor = [UIColor clearColor];
    
    CGFloat cellHeight = self.cellHeights[indexPath.row].floatValue;
    if (cellHeight == kCloseCellHeight) {
        [cell selectedAnimationByIsSelected:NO animated:NO completion:nil];
    }else
    {
        [cell selectedAnimationByIsSelected:YES animated:NO completion:nil];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [[LYHAlertView shareLyhAlertview] showLyhAlertView:self.view text:@"测试测试测试" mode:one afterDelay:2];
//    [LYHAlertView shareLyhAlertview].lyhAlertBlock = ^(){
//        NSLog(@"点了确认");
//    };
    MainCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (![cell isKindOfClass:[MainCell class]]) return;
    
    if (cell.isAnimating) return;
    
    NSTimeInterval duration = 0.f;
    
    CGFloat cellHeight = self.cellHeights[indexPath.row].floatValue;
    
    if (cellHeight == kCloseCellHeight) {
        self.cellHeights[indexPath.row] = @(kOpenCellHeight);
        [cell selectedAnimationByIsSelected:YES animated:YES completion:nil];
        duration = 1.f;
    }
    else
    {
        self.cellHeights[indexPath.row] = @(kCloseCellHeight);
        [cell selectedAnimationByIsSelected:NO animated:YES completion:nil];
        duration = 1.f;
    }
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [tableView beginUpdates];
        [tableView endUpdates];
    } completion:nil];
}

- (NSMutableArray<NSNumber *> *)cellHeights
{
    if (!_cellHeights) {
        _cellHeights = [NSMutableArray array];
    }
    return _cellHeights;
}
/*
#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
//    if (isPush){
//        return;
//    }
    
    if (offsetY >0) {
        CGFloat alpha = offsetY / (SCREEN_WIDTH * (200.0/375.0) - 64) ;
        
        leftView.alpha = 1-alpha;
        navColor = [[UIColor whiteColor] colorWithAlphaComponent:alpha];
        
        CGFloat percent = alpha;
        if (percent > 1){
            percent = 1;
        }
        CGFloat colorF = 255 - (146 * percent);
        leftLabel.textColor = rgba(colorF, colorF, colorF, 1);
        
//        [self.navigationController.navigationBar js_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
        
    } else {
//        [self.navigationController.navigationBar js_setBackgroundColor:[UIColor clearColor]];
    }
    
    if (offsetY >= (SCREEN_WIDTH * (200.0/375.0) - 64)){
        leftImage.image = [UIImage imageNamed:@"down_gray"];
        if (SCREEN_WIDTH != 320){
            //            rightLabel.hidden = NO;
        }
    }else{
        leftImage.image = [UIImage imageNamed:@"nav_icon_arrow"];
        //        rightLabel.hidden = YES;
    }
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
