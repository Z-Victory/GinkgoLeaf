//
//  LYHAlertView.h
//  迎幸业
//
//  Created by 刘亚和 on 2017/9/14.
//  Copyright © 2017年 刘亚和. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AlertMode) {
    one = 0,
    two = 1
};

@protocol LYHALERTDELEGATE <NSObject>

- (void)didselectIndex:(UIButton *)sender;

@end
typedef void(^LYHBlock)();

@interface LYHAlertView : UIView
{
    BOOL isShow;
}
@property (nonatomic, weak) IBOutlet UIButton * okButton;
@property (nonatomic, weak) IBOutlet UIButton * cancleButton;
@property (nonatomic, weak) IBOutlet UILabel * titleLabel;
@property (nonatomic, weak) id<LYHALERTDELEGATE>delegate;
@property (nonatomic, copy) LYHBlock lyhAlertBlock;






+(instancetype)allocWithZone:(struct _NSZone *)zone;

+ (instancetype)shareLyhAlertview;

- (void)showLyhAlertView:(UIView *)view text:(NSString *)text mode:(AlertMode)mode afterDelay:(NSTimeInterval)delay;
@end
