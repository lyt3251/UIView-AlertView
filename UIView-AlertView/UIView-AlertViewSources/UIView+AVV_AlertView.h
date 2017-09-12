//
//  UIView+AlertView.h
//  TXChat
//
//  Created by Cloud on 15/6/29.
//  Copyright (c) 2015年 lingiqngwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVV_CustomAlertView.h"
#import "AVV_AlertViewConfig.h"

@interface AVV_ButtonItem : NSObject

@property (retain, nonatomic) NSString *label;
@property (nonatomic, strong) UIColor *textColor;
@property (copy, nonatomic) void (^action)();
+(id)item;
+(id)itemWithLabel:(NSString *)inLabel;
+(id)itemWithLabel:(NSString *)inLabel andTextColor:(UIColor *)textColor action:(void(^)(void))action;
@end

@class AVV_ButtonItem;

@interface UIView (AVV_AlertView)

@property (nonatomic, strong) AVV_CustomAlertView *alertView;
@property (nonatomic, strong) AVV_AlertViewConfig *alertCfg;

- (void)showAlertViewWithMessage:(NSString *)message andButtonItems:(AVV_ButtonItem *)buttonItem, ...NS_REQUIRES_NIL_TERMINATION;
- (void)showVerticalAlertViewWithMessage:(NSString *)message andButtonItems:(AVV_ButtonItem *)buttonItem, ...NS_REQUIRES_NIL_TERMINATION;
//屏蔽特定error的弹窗
- (void)showAlertViewWithMessage:(NSString *)message andButtonItemsArr:(NSArray *)buttonsArray;
- (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message andButtonItemsArr:(NSArray *)buttonsArray;

@end
