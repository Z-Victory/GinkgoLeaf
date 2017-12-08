//
//  MessageViewController.m
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/12.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *_tableView;
}
@end

@implementation MessageViewController

- (void)viewWillAppear:(BOOL)animated
{
    //    self.navigationController.navigationBar.hidden = YES;
    UIView * statusBarView = [[UIView alloc]   initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.navigationController.navigationBar addSubview:statusBarView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.tableFooterView = [UIView new];
    [_tableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0)
    {
        cell.a.text = @"中国农业银行（北京北苑支行）";
        cell.b.text = @"北京朝阳区奥运村街道天溪园";
        cell.c.text = @"此次举办的空军建军节是建国以来规模最大一次的建军节，参加人数巴拉巴拉巴拉";
        //空的
        cell.d.text = @"";
    }
    else if (indexPath.row == 1)
    {
        cell.a.text = @"中国国学书画院";
        cell.b.text = @"北京市昌平区东小口镇中东路东小口森林公园";
        cell.c.text = @"";
        cell.d.text = @"";
    }
    else if (indexPath.row == 2)
    {
        cell.a.text = @"回龙观地铁站";
        cell.b.text = @"北京市昌平区龙泽街道";
        cell.c.text = @"";
        cell.d.text = @"拜访对象王安石";
        cell.imgA.image = [UIImage imageNamed:@"photo"];
    }
    return cell;
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
