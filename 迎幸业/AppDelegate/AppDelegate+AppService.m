//
//  AppDelegate+AppService.m
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/11.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import "AppDelegate+AppService.h"

@implementation AppDelegate (AppService)
+(UINavigationController *)initWithRootViewController:(BaseLYHViewController *)controller
                                                title:(NSString *)title
                                          selectImage:(NSString *)selectImg
                                        noSelectImage:(NSString *)noSelectImg
{
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:controller];
    controller.title = title;
    controller.view.backgroundColor = [UIColor whiteColor];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectImg];
    nav.tabBarItem.image = [UIImage imageNamed:noSelectImg];
    return nav;
}
@end
