//
//  LYHAlertView.m
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/14.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import "LYHAlertView.h"
#import "AppDelegate.h"



static LYHAlertView * lyhAlertView;
@implementation LYHAlertView

//+(instancetype)shareLyhAlertview:(struct _NSZone *)zone
//{
//    @synchronized (self) {
//        //防止多线程同时访问对象，造成多次分配内存，用线程锁加限制
//        if (lyhAlertView == nil)
//        {
//            lyhAlertView = [super allocWithZone:zone];
//        }
//        return lyhAlertView;
//    }
//}
//
//+ (instancetype)shareLyhAlertview
//{
//    return [[self alloc]init];
//}

+(LYHAlertView *)shareLyhAlertview
{
    @synchronized (self) {
        //防止多线程同时访问对象，造成多次分配内存，用线程锁加限制
        if (lyhAlertView == nil)
        {
            lyhAlertView = [[super alloc]init];
        }
        return lyhAlertView;
    }
}

- (void)showLyhAlertView:(UIView *)view text:(NSString *)text mode:(AlertMode)mode afterDelay:(NSTimeInterval)delay
{
    if (!isShow)
    {
        isShow = YES;
        self.titleLabel.text = text;
        lyhAlertView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        UIView * alview = [[NSBundle mainBundle]loadNibNamed:@"LYHAlertView" owner:self  options:nil].firstObject;
        alview.frame = lyhAlertView.frame;
        [lyhAlertView addSubview:alview];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.window addSubview:lyhAlertView];
    }
    else
    {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.window addSubview:lyhAlertView];
    }
}

- (IBAction)removeView:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        self.lyhAlertBlock();
    }
    [lyhAlertView removeFromSuperview];
//    isShow = NO;
}

- (id)copyWithZone:(NSZone *)zone
{
    return lyhAlertView;
}
- (id)mutableCopyWithZone:(NSZone *)zone
{
    return lyhAlertView;
}

@end
