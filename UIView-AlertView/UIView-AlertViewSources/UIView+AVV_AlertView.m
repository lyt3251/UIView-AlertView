//
//  UIView+AlertView.m
//  TXChat
//
//  Created by Cloud on 15/6/29.
//  Copyright (c) 2015年 lingiqngwan. All rights reserved.
//

#import "UIView+AVV_AlertView.h"
#import <objc/runtime.h>
#import "UIView+AVV_Utils.h"
#import "BUIBlockUI.h"
#import "AVV_MacroDef.h"

static void *AVV_CustomAlertViewKey = (void *)@"AVV_CustomAlertViewKey";
static void *AVV_AlertViewConfigKey = (void *)@"AVV_AlertViewConfigKey";

@implementation UIView (AVV_AlertView)

@dynamic alertView;
@dynamic alertCfg;

- (AVV_CustomAlertView *)alertView{
    return objc_getAssociatedObject(self, AVV_CustomAlertViewKey);
}

- (void)setAlertView:(AVV_CustomAlertView *)alertView
{
    objc_setAssociatedObject(self, AVV_CustomAlertViewKey, alertView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (AVV_AlertViewConfig *)alertCfg
{
    return objc_getAssociatedObject(self, AVV_AlertViewConfigKey);
}

- (void)setAlertCfg:(AVV_AlertViewConfig *)alertCfg
{
    objc_setAssociatedObject(self, AVV_AlertViewConfigKey, alertCfg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



#pragma mark - ShowAlertView
- (void)showAlertViewWithMessage:(NSString *)message andButtonItemsArr:(NSArray *)buttonsArray
{
    [self showAlertViewWithMessage:message andButtonItemsArr:buttonsArray isVertical:NO];
}

- (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message andButtonItemsArr:(NSArray *)buttonsArray
{
    [self showAlertViewWithTitle:title andMessage:message andButtonItemsArr:buttonsArray isVertical:NO];
}


/**
 *  弹出Alert效果
 *
 *  @param message      标题
 *  @param buttonsArray 按钮数组
 *  @param isVertical   按钮是否是竖着排列
 */
- (void)showAlertViewWithTitle:(NSString *)title
                    andMessage:(NSString *)message
             andButtonItemsArr:(NSArray *)buttonsArray
                    isVertical:(BOOL)isVertical{
    if (self.alertView) {
        [self.alertView removeFromSuperview];
    }
    
    if(!self.alertCfg)
    {
        self.alertCfg = [AVV_AlertViewConfig sharedInstance];
    }
    AVV_AlertViewConfig *config = self.alertCfg;
    
    [self endEditing:YES];
    
    CGFloat alertWidth = kAVV_ScreenWidth - 80;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        alertWidth = 270;
    }
    
    
    UIView *alertBgView = [[UIView alloc] initWithFrame:CGRectZero];
    alertBgView.backgroundColor = config.alertViewBKColor;
    alertBgView.clipsToBounds = YES;
    alertBgView.layer.cornerRadius = 3.f;
    
    UILabel *titleLb = [[UILabel alloc] initClearColorWithFrame:CGRectZero];
    titleLb.font = config.titleFont;
    titleLb.textColor = config.titleColor;
    titleLb.text = title;
    titleLb.textAlignment = NSTextAlignmentCenter;
    [alertBgView addSubview:titleLb];
    [titleLb sizeToFit];
    if (titleLb.height_) {
        titleLb.frame = CGRectMake(22, 20, alertWidth - 44, titleLb.height_);
    }
    
    UILabel *messageLb = [[UILabel alloc] initClearColorWithFrame:CGRectZero];
    messageLb.font = config.msgFont;
    messageLb.numberOfLines = 0;
    if (titleLb.height_) {
        messageLb.textColor = config.msgColor;
    }else{
        messageLb.textColor = config.msgNoTitleColor;
    }
    messageLb.textAlignment = NSTextAlignmentLeft;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:message];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:7];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [message length])];
    messageLb.attributedText = attributedString;
    [alertBgView addSubview:messageLb];
    CGSize messageSize = [messageLb sizeThatFits:CGSizeMake(alertWidth - 44, MAXFLOAT)];
    if (messageSize.width < alertWidth - 44) {
        if (titleLb.height_) {
            messageLb.frame = CGRectMake((alertWidth - messageSize.width)/2 , 20 + titleLb.height_ + 20, messageSize.width, messageSize.height);
        }else{
            messageLb.frame = CGRectMake((alertWidth - messageSize.width)/2 , 20, messageSize.width, messageSize.height);
        }
    }else{
        if (titleLb.height_) {
            messageLb.frame = CGRectMake(22, 20 + titleLb.height_ + 20, messageSize.width, messageSize.height);
        }else{
            messageLb.frame = CGRectMake(22, 20, messageSize.width, messageSize.height);
        }
    }
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = config.lineColor;
    [alertBgView addSubview:lineView];
    CGFloat beginY = messageLb.maxY + 15;
    lineView.frame = CGRectMake(0, beginY, alertWidth, config.lineHeight);
    
    
    if (isVertical) {
        if ([buttonsArray count] == 0) {
            alertBgView.frame = CGRectMake(0, 0, alertWidth, messageLb.maxY + 18);
        }else{
            CGFloat width = messageLb.frame.size.width;
            CGFloat X = messageLb.minX;
            CGFloat Y = messageLb.maxY + 15;
            __weak typeof(self)tmpObject = self;
            for(AVV_ButtonItem *item in buttonsArray)
            {
                NSInteger index = [buttonsArray indexOfObject:item];
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                if (index != buttonsArray.count - 1) {
//                    btn.layer.borderColor =  config.lineColor.CGColor;
//                    btn.layer.borderWidth = config.lineHeight;
                    UIView *rightLine = [[UIView alloc] init];
                    rightLine.backgroundColor = config.lineColor;
                    [alertBgView addSubview:rightLine];
                    rightLine.frame = CGRectMake(X+width, beginY, config.lineHeight, Y +34 + 18 +10 -  beginY);
                    
                    [btn setTitleColor:config.btnNormalColor forState:UIControlStateNormal];
                    btn.backgroundColor = config.btnNormalBKColor;
                }else{
                    [btn setTitleColor:config.btnSelectedColor forState:UIControlStateNormal];
                    btn.backgroundColor = config.btnSelectedBKColor;
                }
                btn.layer.cornerRadius = 3.f;
                btn.layer.masksToBounds = YES;
                [btn setTitle:item.label forState:UIControlStateNormal];
                btn.titleLabel.font = config.btnNormalFont;
                btn.frame = CGRectMake(X, Y, width, 34);
                [alertBgView addSubview:btn];
                [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
                    [tmpObject.alertView close];
                    if (item.action) {
                        item.action();
                    }
                }];
                Y = btn.maxY + 10;
                alertBgView.frame = CGRectMake(0, 0, alertWidth, btn.maxY + 18);
            }
        }
    }else{
        if ([buttonsArray count] == 0) {
            alertBgView.frame = CGRectMake(0, 0, alertWidth, messageLb.maxY + 18);
        }else{
            CGFloat width = (alertWidth - 15 * (buttonsArray.count + 1))/buttonsArray.count;
            CGFloat X = 15;
            __weak typeof(self)tmpObject = self;
            for(AVV_ButtonItem *item in buttonsArray)
            {
                NSInteger index = [buttonsArray indexOfObject:item];
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                if (index != buttonsArray.count - 1) {

                    [btn setTitleColor:config.btnNormalColor forState:UIControlStateNormal];
                    btn.backgroundColor = config.btnNormalBKColor;
                }else{
                    [btn setTitleColor:config.btnSelectedColor forState:UIControlStateNormal];
                    btn.backgroundColor = config.btnSelectedBKColor;
                }
                btn.layer.cornerRadius = 3.f;
                btn.layer.masksToBounds = YES;
                [btn setTitle:item.label forState:UIControlStateNormal];
                btn.titleLabel.font = config.btnNormalFont;
                btn.frame = CGRectMake(X, messageLb.maxY + 20 + 6.5, width, 34);
                [alertBgView addSubview:btn];
                [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
                    [tmpObject.alertView close];
                    if (item.action) {
                        item.action();
                    }
                }];
                X = btn.maxX + 15;
                alertBgView.frame = CGRectMake(0, 0, alertWidth, btn.maxY + 11.5);
                if (index != buttonsArray.count - 1) {
                    UIView *rightLine = [[UIView alloc] init];
                    rightLine.backgroundColor = config.lineColor;
                    [alertBgView addSubview:rightLine];
                    rightLine.frame = CGRectMake(btn.maxX + 15/2, beginY, config.lineHeight, alertBgView.maxY -  beginY);
                }
                
            }
        }
    }
    self.alertView = [[AVV_CustomAlertView alloc] init];
    self.alertView.buttonTitles = [NSArray array];
    [self.alertView setContainerView:alertBgView];
    [self.alertView show];
    if ([buttonsArray count] == 0) {
        //1.5秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.alertView close];
        });
    }
    self.alertView.dialogView.clipsToBounds = YES;
}
- (void)showAlertViewWithMessage:(NSString *)message
               andButtonItemsArr:(NSArray *)buttonsArray
                      isVertical:(BOOL)isVertical{
    [self showAlertViewWithTitle:nil andMessage:message andButtonItemsArr:buttonsArray isVertical:isVertical];
}

- (void)showAlertViewWithMessage:(NSString *)message andButtonItems:(AVV_ButtonItem *)ButtonItem, ...{
    va_list args;
    va_start(args, ButtonItem);
    
    NSMutableArray *buttonsArray = [NSMutableArray array];
    if(ButtonItem)
    {
        [buttonsArray addObject:ButtonItem];
        AVV_ButtonItem *nextItem;
        while((nextItem = va_arg(args, AVV_ButtonItem *)))
        {
            [buttonsArray addObject:nextItem];
        }
    }
    va_end(args);
    [self showAlertViewWithMessage:message andButtonItemsArr:buttonsArray];
}
//添加竖着的按钮alert
- (void)showVerticalAlertViewWithMessage:(NSString *)message andButtonItems:(AVV_ButtonItem *)ButtonItem, ...{
    va_list args;
    va_start(args, ButtonItem);
    
    NSMutableArray *buttonsArray = [NSMutableArray array];
    if(ButtonItem)
    {
        [buttonsArray addObject:ButtonItem];
        AVV_ButtonItem *nextItem;
        while((nextItem = va_arg(args, AVV_ButtonItem *)))
        {
            [buttonsArray addObject:nextItem];
        }
    }
    va_end(args);
    [self showAlertViewWithMessage:message andButtonItemsArr:buttonsArray isVertical:YES];
}
@end

@implementation AVV_ButtonItem

+(id)item
{
    return [self new];
}

+(id)itemWithLabel:(NSString *)inLabel
{
    AVV_ButtonItem *newItem = [self item];
    [newItem setLabel:inLabel];
    return newItem;
}

+(id)itemWithLabel:(NSString *)inLabel andTextColor:(UIColor *)textColor action:(void(^)(void))action
{
    AVV_ButtonItem *newItem = [self itemWithLabel:inLabel];
    newItem.textColor = textColor;
    [newItem setAction:action];
    return newItem;
}

@end
