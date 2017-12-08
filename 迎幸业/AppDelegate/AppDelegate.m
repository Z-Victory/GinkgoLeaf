//
//  AppDelegate.m
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/11.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MyViewController.h"
#import "MessageViewController.h"
#import "AppDelegate+AppService.h"

@interface AppDelegate ()<UITabBarControllerDelegate>
{
    NSArray * imageAndTitleArray;
//    NSMutableArray * controllerArray;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    imageAndTitleArray = @[@{@"title":@"首页",@"image":@"首页",@"selectImage":@"首页选中"},
                           @{@"title":@"消息",@"image":@"消息未选中",@"selectImage":@"消息选中"},
                           @{@"title":@"我的",@"image":@"我的未选中",@"selectImage":@"我的选中"}];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 设置相应的 ViewController
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"firstOpen"] isEqualToString:@"YES"])
    {
        LeadViewController * vc = [[LeadViewController alloc] init];
        self.window.rootViewController = vc;
    }
    else
    {
        UITabBarController * tabBar = [[UITabBarController alloc]init];
        
        NSMutableArray * navMutArray = [NSMutableArray array];
        
        MainViewController * homeVC = [[MainViewController alloc] init];
        
        MessageViewController * messageVC = [[MessageViewController alloc] init];
        
        MyViewController * myVC = [[MyViewController alloc] init];
        
        NSArray * controllerArray = @[homeVC,messageVC,myVC];
        //默认
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        // 选中
        NSMutableDictionary *attrSelected = [NSMutableDictionary dictionary];
        attrSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        attrSelected[NSForegroundColorAttributeName] = [UIColor colorWithRed:93/255.0 green:74/255.0 blue:153/255.0 alpha:1];
        
        for (int i = 0; i <controllerArray.count; i++)
        {
            NSDictionary * dic = imageAndTitleArray[i];
            UINavigationController * nav = [AppDelegate initWithRootViewController:controllerArray[i] title:dic[@"title"] selectImage:dic[@"image"] noSelectImage:dic[@"selectImage"]];
            
            [nav.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
            [nav.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
            [navMutArray addObject:nav];
        }
        tabBar.viewControllers = navMutArray;
        tabBar.delegate = self;
        self.window.rootViewController = tabBar;
    }
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    // 默认
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    
//    // 选中
//    NSMutableDictionary *attrSelected = [NSMutableDictionary dictionary];
//    attrSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    attrSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
//    
//    
//    UITabBarItem *item = [UITabBarItem appearance];
//    [item setTitleTextAttributes:attrSelected forState:UIControlStateNormal];
//    [item setTitleTextAttributes:attrSelected forState:UIControlStateNormal];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
