//
//  BaseLYHViewController.h
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/11.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicFuntion.h"

/**
 基类 定义公共的方法以及公共的属性
 */
@interface BaseLYHViewController : UIViewController
#pragma mark -- 跟据16位＃颜色值返回颜色
- (UIColor *) hexStringToColor: (NSString *) stringToConvert;
@end
