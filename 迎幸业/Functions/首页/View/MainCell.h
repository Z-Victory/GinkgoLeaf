//
//  MainCell.h
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/12.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCFoldCell.h"

@interface MainCell :CCFoldCell
@property (nonatomic, weak) IBOutlet UILabel *closeNumberLabel;

@property (nonatomic, weak) IBOutlet UILabel *openNumberLabel;

- (void)setNumber:(NSInteger)number;
@end
