//
//  AppDelegate+AppService.h
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/11.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)
+(UINavigationController *)initWithRootViewController:(BaseLYHViewController *)controller
                                                title:(NSString *)title
                                          selectImage:(NSString *)selectImg
                                        noSelectImage:(NSString *)noSelectImg;
@end
